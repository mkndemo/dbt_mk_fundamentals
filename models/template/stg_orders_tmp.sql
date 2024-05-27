{{ config( materialized = 'table') }}

with source as (
    select * from raw_jaffle_shop.raw_orders
),

renamed as (
    select
        id as order_id,
        store_id as location_id,
        customer as customer_id,
        (order_total / 100.0) as order_total,
        (tax_paid / 100.0) as tax_paid,
        ordered_at
    from source
)

select * from renamed