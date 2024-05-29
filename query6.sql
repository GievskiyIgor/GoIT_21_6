select
    students.id,
    students.fullname,
    groups.name as group_name

from 
    students 
join
    groups on students.group_id = groups.id;
