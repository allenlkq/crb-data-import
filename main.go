package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"regexp"
	"strings"
	"strconv"
	"time"
	"os/exec"
	"log"
	"text/template"
	"io/ioutil"
)

/*
insert curriculums (N1 N2 K1 K2 Nursery Composite and Secondary School (Dance), Primary School (Dance))
insert 52 lessons
insert staff and schools
insert classes,  match school to existing school list, report missing schools
insert sessions

*/

type schedule struct {
	Class		string
	School		string
	Programme	string
	Curriculum	string
	Teacher		string
	Duration	float64
	Sessions	[]session
	// rest are for database
	TenantId	string
	OrgId		string
	OrgProfileId	string
	CurriculumId	string
	ClassId		string
}

type session struct {
	StartTime	int64
	EndTime		int64
	Lesson		string
	CurriculumId	string
	SessionId	string
	EventId		string
	Class		string
	ClassId		string
	School		string
}

var ProgName = "LG"
func main() {
	// clearing output file
	outputFile := "output." + ProgName + ".sql"
	os.Remove(outputFile)
	os.Create(outputFile)
	f, _ := os.OpenFile(outputFile, os.O_APPEND|os.O_WRONLY, 0666)
	defer f.Close()
	// template for curriculum, class, lesson
	sql, _ := ioutil.ReadFile("sql-template/import-class.sql")
	classTpl, _ := template.New("classTpl").Parse(string(sql))
	// template for session
	sql, _ = ioutil.ReadFile("sql-template/import-session.sql")
	sessionTpl, _ := template.New("sessionTpl").Parse(string(sql))


	file, _ := os.Open("csv/" + ProgName + ".csv")
	defer file.Close()
	reader := csv.NewReader(file)
	reader.Comma = ','
	reader.Read() // start from second line
	for {
		row, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			fmt.Println("Error:", err)
			return
		}
		hours,_ := strconv.ParseFloat(row[5], 64)
		s := schedule{
			Programme: ProgName,
			Class: strings.TrimSpace(strings.Replace(row[1], "'", "\\'", -1)),
			Teacher: strings.TrimSpace(row[2]),
			Duration: hours * 60,
			Sessions: []session{},
		}

		// parse classs into school and curriculum
		r := regexp.MustCompile(`(?P<School>[^\-]+) - (?P<Curriculum>[^(]+)`)
		m := r.FindStringSubmatch(s.Class)
		s.School = strings.TrimSpace(m[1])
		s.Curriculum = ProgName + " " + strings.ToUpper(strings.TrimSpace(m[2]))
		// unique ids for database insertion
		s.TenantId = uniqueId()
		s.OrgId = uniqueId()
		s.OrgProfileId = uniqueId()
		s.CurriculumId = "crclm" + uniqueId()
		s.ClassId = "cls" + uniqueId()

		// add dates from col 9 to col 80
		classStartTime := strings.Replace(row[6], " ", "", -1)
		classEndTime := strings.Replace(row[7], " ", "", -1)
		timeLayout := "2006-01-02 3:04PM"
		lessonCount := 1
		for i:=9; i<=80; i++ {
			day, err := strconv.ParseInt(row[i], 10, 64)
			if err != nil {
				continue
			}
			month := (i-9)/6 + 1
			strStart := fmt.Sprintf("2017-%02d-%02d %s", month, day, classStartTime)
			strEnd := fmt.Sprintf("2017-%02d-%02d %s", month, day, classEndTime)
			startTime,_ := time.ParseInLocation(timeLayout, strStart, time.Local)
			endTime,_ := time.ParseInLocation(timeLayout, strEnd, time.Local)
			sess := session{
				StartTime: startTime.Unix(),
				EndTime: endTime.Unix(),
				Lesson: "Lesson " + strconv.Itoa(lessonCount),
				CurriculumId: s.CurriculumId,
				SessionId: "s" + uniqueId(),
				EventId: "E" + uniqueId(),
				Class: s.Class,
				ClassId: s.ClassId,
				School: s.School,
			}
			lessonCount += 1
			s.Sessions = append(s.Sessions, sess)
		}

		for ;lessonCount<=60; lessonCount++ {
			sess := session{
				StartTime: 0,
				EndTime: 0,
				Lesson: "Lesson " + strconv.Itoa(lessonCount),
				CurriculumId: s.CurriculumId,
				SessionId: "s" + uniqueId(),
				EventId: "E" + uniqueId(),
				Class: s.Class,
				ClassId: s.ClassId,
				School: s.School,
			}
			s.Sessions = append(s.Sessions, sess)
		}

		fmt.Printf("%+v\n", s)
		// now objects are populated, go generate db sql
		f.Write([]byte("START TRANSACTION;\n"))
		// generate sql for class
		if err := classTpl.Execute(f, s); err != nil {
			panic(err)
		}

		// generate sql for session
		for _, session := range s.Sessions {
			if err := sessionTpl.Execute(f, session); err != nil {
				panic(err)
			}
		}

		f.Write([]byte("\nCOMMIT;\n"))

	}
}

func uniqueId() string {
	out, err := exec.Command("sh", "-c", "php -r 'echo uniqid();'").Output()
	if err != nil {
		log.Fatal(err)
	}
	return string(out)
}