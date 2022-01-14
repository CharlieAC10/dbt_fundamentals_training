with orders as (
    select * from {{ ref ('stg_orders')}}
),

payments as (
    select * from {{ ref ('stg_stripe')}}
),

orders_payments as (

    select
        order_id,
        customer_id,
        sum(amount) as amount

    from orders

    left join payments using (order_id)

    group by 1, 2

)

select * from orders_payments