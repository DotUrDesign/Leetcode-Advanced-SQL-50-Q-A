+---------+------+
| seat_id | free |  lead lag
+---------+------+      
| 1       | 1    |  0   N
| 2       | 0    |  1   1
| 3       | 1    |  1   0
| 4       | 1    |  1   1
| 5       | 1    |  N   1
+---------+------+

free = 1 and (lead = 1 or lag = 1)



with prev_next_seats as (
    select 
    seat_id, free, 
    lead(free, 1) over (order by seat_id) as ld,
    lag(free, 1) over (order by seat_id) as lg
    from cinema
)

select seat_id
from prev_next_seats
where free = 1 and (ld = 1 or lg = 1)
