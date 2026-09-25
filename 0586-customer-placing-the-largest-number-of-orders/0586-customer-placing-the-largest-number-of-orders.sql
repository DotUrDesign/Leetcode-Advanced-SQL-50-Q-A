select customer_number
from orders 
group by customer_number
order by count(customer_number) desc
limit 1


Follow up question:

with ranked_cte as (
    select 
    customer_number, rank() over (order by no_of_orders desc) as rnk
    from (
        select customer_number, count(*) as 'no_of_orders'
        from orders 
        group by customer_number 
    ) t
)

select customer_number  
from ranked_cte 
where rnk = 1
