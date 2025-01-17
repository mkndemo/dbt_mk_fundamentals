{{
    config(
        materialized = 'table',
        unique_key = 'order_id'
    )
}}

with

source as (

    select * from {{ source('raw_jaffle_shop', 'raw_orders') }}

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- properties
        (order_total / 100.0) as order_total,
        (tax_paid / 100.0) as tax_paid,

        ---------- timestamps
        ordered_at,
        'test' as test

    from source

)

select * from renamed