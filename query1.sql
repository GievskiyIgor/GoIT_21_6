select
    students.id,
    students.fullname,
    ROUND(AVG(grades.grade),2) as average_grade

from 
    students 
join 
    grades on students.id = grades.student_id
group by 
    students.id
order by 
    average_grade desc
limit 5;    