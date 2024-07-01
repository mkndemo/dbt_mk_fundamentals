{{
    config(
        materialized='incremental'
    )
}}

with events as (
    select * 
    from {{ source('stripe', 'raw_payment') }}

    {% if is_incremental() %}
    where _batched_at >= (select top 1 _batched_at from {{this}} order by _batched_at desc )
    {% endif %}
),

final as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created as created_at,
        _batched_at

    from events
)
select * from final
