/* import a single row from master schedule*/
/* school */
INSERT IGNORE INTO tenant_5 (id, name, code, status, created_at) VALUES ('{{.TenantId}}', '{{.School}}', '', 'active', CURRENT_TIMESTAMP );
INSERT IGNORE INTO org_5 (id, tenant_id, name, status, created_at) VALUES ('{{.OrgId}}', '{{.TenantId}}', '{{.School}}', 'active', CURRENT_TIMESTAMP);
INSERT IGNORE INTO org_profile_5 (id, org_id, type, status, created_at) VALUES ('{{.OrgProfileId}}', '{{.OrgId}}', 'SCHOOL', 'active', CURRENT_TIMESTAMP);

/*staff already done*/

/* curriculums */
SELECT @programmeid := `id` FROM programme_5 WHERE code = '{{.Programme}}';
INSERT IGNORE INTO curriculum_5 (id, programme_id, name, description, duration, tenant_id, status, age_min, age_max, created_at) VALUES
('{{.CurriculumId}}', @programmeid, '{{.Curriculum}}', '','{{.Duration}}', '58ec49e2b8fa1','active', 3, 12, CURRENT_TIMESTAMP );

/* lesson */
SELECT @curriculumid := `id` FROM curriculum_5 WHERE name = '{{.Curriculum}}' and programme_id = @programmeid;

INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 1', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 2', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 3', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 4', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 5', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 6', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 7', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 8', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 9', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 10', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 11', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 12', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 13', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 14', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 15', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 16', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 17', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 18', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 19', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 20', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 21', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 22', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 23', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 24', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 25', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 26', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 27', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 28', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 29', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 30', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 31', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 32', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 33', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 34', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 35', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 36', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 37', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 38', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 39', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 40', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 41', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 42', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 43', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 44', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 45', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 46', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 47', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 48', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 49', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 50', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 51', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 52', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 53', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 54', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 55', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 56', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 57', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 58', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 59', CURRENT_TIMESTAMP );
INSERT INTO lesson_5 (curriculum_id, name, created_at) values (@curriculumid, 'Lesson 60', CURRENT_TIMESTAMP );


/* class */
SELECT @schoolid := id FROM tenant_5 WHERE name = '{{.School}}';
SELECT @teacherid := `id` FROM user_5 WHERE name like('{{.Teacher}}%') LIMIT 1;
SELECT @programmeid := `id` FROM programme_5 WHERE code = '{{.Programme}}';
SELECT @curriculumid := `id` FROM curriculum_5 WHERE name = '{{.Curriculum}}' and programme_id = @programmeid;

insert into class_5 (id, programme_id, curriculum_id, school_id, name, description, tenant_id, status, teacher_id, created_at)
values ('{{.ClassId}}', @programmeid,@curriculumid, @schoolid, '{{.Class}}', '{{.Class}}', '58ec49e2b8fa1', 'active', @teacherid, CURRENT_TIMESTAMP);

