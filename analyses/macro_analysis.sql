with customers as (
    select * from {{ ref('stg_payments') }}
),

dynamic as (
    select
        {{ my_dynamic_column('status') }} as state,
        payment_id,
        order_id
    from customers
)

select * from dynamic