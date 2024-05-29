select
    students.id as student_id,
    ROUND(AVG(grades.grade),2) as average_grade
from 
    students 
join 
    grades on students.id = grades.student_id
where 
    grades.student_id = 1
group by 
    students.id;
