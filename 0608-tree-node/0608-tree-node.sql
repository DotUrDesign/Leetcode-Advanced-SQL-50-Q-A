with inner_nodes as (
    select distinct p_id
    from tree
    where id not in (select id from tree where p_id is null)
)

select id, 'Root' as type from tree where p_id is null
union all 
select p_id, 'Inner' as type from inner_nodes
union all 
select id, 'Leaf' as type from tree where id not in (select p_id from inner_nodes) 