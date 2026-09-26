with next_value as (
    select x, lead(x, 1) over(order by x) as ld
    from point 
    order by x 
)

select abs(x-ld) as shortest
from next_value
where ld is not null
order by shortest asc
limit 1