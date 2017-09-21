/* import a single row from master schedule*/
/* school */
INSERT IGNORE INTO tenant_5 (id, name, code, status) VALUES ('{{.TenantId}}', '{{.School}}', '', 'active');
INSERT IGNORE INTO org_5 (id, tenant_id, name, status) VALUES ('{{.OrgId}}', '{{.TenantId}}', '{{.School}}', 'active');
INSERT IGNORE INTO org_profile_5 (id, org_id, type, status) VALUES ('{{.OrgProfileId}}', '{{.OrgId}}', 'SCHOOL', 'active');

/*staff already done*/

/* curriculums */
SELECT @programmeid := `id` FROM programme_5 WHERE code = '{{.Programme}}';
INSERT IGNORE INTO curriculum_5 (id, programme_id, name, description, duration, tenant_id, status, age_min, age_max) VALUES
('{{.CurriculumId}}', @programmeid, '{{.Curriculum}}', '','{{.Duration}}', '58ec49e2b8fa1','active', 3, 12);

/* lesson */
SELECT @curriculumid := `id` FROM curriculum_5 WHERE name = '{{.Curriculum}}';

INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 1');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 2');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 3');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 4');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 5');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 6');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 7');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 8');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 9');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 10');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 11');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 12');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 13');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 14');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 15');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 16');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 17');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 18');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 19');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 20');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 21');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 22');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 23');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 24');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 25');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 26');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 27');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 28');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 29');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 30');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 31');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 32');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 33');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 34');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 35');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 36');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 37');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 38');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 39');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 40');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 41');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 42');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 43');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 44');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 45');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 46');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 47');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 48');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 49');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 50');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 51');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 52');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 53');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 54');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 55');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 56');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 57');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 58');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 59');
INSERT INTO lesson_5 (curriculum_id, name) values (@curriculumid, 'Lesson 60');


/* class */
SELECT @schoolid := id FROM tenant_5 WHERE name = '{{.School}}';
SELECT @teacherid := `id` FROM user_5 WHERE name like('{{.Teacher}}%') LIMIT 1;
SELECT @programmeid := `id` FROM programme_5 WHERE code = '{{.Programme}}';
SELECT @curriculumid := `id` FROM curriculum_5 WHERE name = '{{.Curriculum}}';

insert into class_5 (id, programme_id, curriculum_id, school_id, name, description, tenant_id, status, teacher_id)
values ('{{.ClassId}}', @programmeid,@curriculumid, @schoolid, '{{.Class}}', '{{.Class}}', '58ec49e2b8fa1', 'active', @teacherid);

