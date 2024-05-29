select
    id,
    fullname
from 
    teachers;

select
    ROUND(AVG(grade),2) as average_grade
from 
    grades
where 
    subject_id in (
        select 
            id
        from 
            subjects
        where
            teacher_id = 3         
        );
