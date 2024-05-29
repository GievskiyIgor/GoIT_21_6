select
    id,
    fullname
from    
    students;    
    
select  
    students.fullname,
    subjects.name as course_name
from 
    students        
join
    groups on students.group_id = groups.id
join
    grades on students.id = grades.student_id
join
    subjects on grades.subject_id = subjects.id        
where 
    students.id = 33;