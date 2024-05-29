select
    students.id,
    students.fullname,
    ROUND(AVG(grades.grade),2) as average_grade

from 
    grades 
join 
    students on students.id = grades.student_id
where 
    grades.student_id = 1
group by 
    students.id
order by    
    average_grade desc
limit 1;  