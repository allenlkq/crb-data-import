
SELECT @lessonid := `id` FROM lesson_5 WHERE name = '{{.Lesson}}' and curriculum_id = @curriculumid;
insert into session_5 (id, programme_id, curriculum_id, school_id, lesson_id, class_id, teacher_id,
name, description, start_time, end_time, address, tenant_id, status)
values ('{{.SessionId}}', @programmeid,@curriculumid, @schoolid, @lessonid,'{{.ClassId}}', @teacherid,
'{{.Lesson}}','{{.Lesson}}', '{{.StartTime}}', '{{.EndTime}}', '{{.School}}','58ec49e2b8fa1', 'active');

insert into event_5 (id, name, type, start_time, end_time, relevant_id, tenant_id, status)
values ('{{.EventId}}', '{{.Class}} {{.Lesson}}','session', '{{.StartTime}}', '{{.EndTime}}', '{{.SessionId}}','58ec49e2b8fa1', 'active');
