select 
    *
from 
    subjects;

select 
    students.fullname,
    groups.name as group_name,
    grades.grade
from 
    students 
join 
    groups on students.group_id = groups.id
join
    grades on students.id = grades.student_id
join
    subjects on grades.subject_id = subjects.id
where
    subjects.id = 1;
