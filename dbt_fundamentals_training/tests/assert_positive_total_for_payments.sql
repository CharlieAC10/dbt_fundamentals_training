with payments as (
    select * from {{ ref('stg_stripe')}}
)

select 
    order_id,
    sum(amount) as total_amount

from payments

group by 1

having not(total_amount >= 0)