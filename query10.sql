select 
    students.fullname as student_name,
    teachers.fullname as teacher_name,
    subjects.name as subject_name
from 
    students 
join 
    groups on students.group_id = groups.id
join 
    grades on grades.student_id = students.id
join
    subjects on grades.subject_id = subjects.id 
join
    teachers on subjects.teacher_id = teachers.id 
where
    students.id = 44;