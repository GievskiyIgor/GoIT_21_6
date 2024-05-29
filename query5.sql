select
    teachers.fullname as teacher_name,
    subjects.name as course_name

from 
    teachers 
join 
    subjects on teachers.id = subjects.teacher_id;