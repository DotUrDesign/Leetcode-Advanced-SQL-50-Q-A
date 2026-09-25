with ranked_cte as (
    select 
    name, salary, departmentId, rank() over (partition by departmentId order by salary desc) as rnk
    from employee
)

select 
d.name as Department, rc.name as Employee, rc.salary as Salary
from ranked_cte rc
join department d
on rc.departmentId = d.id
where rc.rnk = 1
