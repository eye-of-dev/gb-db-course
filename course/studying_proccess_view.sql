create view studying_proccess_view as
select 
	users_edu_modules.users_id,
	users_edu_modules.modules_id,
    users_edu_modules.status as modules_status,
    users_edu_courses.courses_id,
    users_edu_courses.status as courses_status,
    users_edu_lessons.lessons_id,
    users_edu_lessons.start_date,
    users_edu_lessons.status as lessons_status,
    users_edu_lessons_tests.tests_id,
    users_edu_lessons_tests.description
from 
	users_edu_modules
join 
	users_edu_courses ON users_edu_courses.users_edu_modules_id = users_edu_modules.id
join 
	users_edu_lessons ON users_edu_lessons.users_edu_courses_id = users_edu_courses.id
join 
	users_edu_lessons_tests ON users_edu_lessons_tests.users_edu_lessons_id = users_edu_lessons.id