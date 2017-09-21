TRUNCATE TABLE curriculum_5;
TRUNCATE TABLE lesson_5;
TRUNCATE TABLE class_5;
TRUNCATE TABLE session_5;
DELETE from event_5 where type = 'session';

/* populate code */
update tenant_5 set code = UPPER(CONCAT(SUBSTRING(replace(name, ' ', ''),1,8), '_',SUBSTRING(MD5(name), 1, 7)))
update org_5 inner join tenant_5 on org_5.tenant_id = tenant_5.id set org_5.code = tenant_5.code
