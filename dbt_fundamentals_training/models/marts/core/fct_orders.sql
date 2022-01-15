with orders as (
    select * from {{ ref ('stg_orders')}}
),

payments as (
    select * from {{ ref ('stg_stripe')}}
),

orders_payments as (

    select
        order_id,
        sum( case when status = 'success' then amount end) as amount

    from payments 

    group by 1

)

select * from orders_payments