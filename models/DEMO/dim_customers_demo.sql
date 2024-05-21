{{ config( materialized = 'table') }}

with customers as (
    select * from {{ ref('stg_customers_demo') }}
),

orders as (
    select * from {{ ref('stg_orders_demo') }}
),

customer_orders as (
    select
        c.customer_id,
        c.customer_name,
        sum(o.order_total) as total_order_value,
        case 
            when total_order_value > 75 then 'gold'
            else 'normal'
        end as customer_type
    from customers c
    left join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.customer_name
)

select * from customer_orders