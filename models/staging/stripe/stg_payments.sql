select
    id as payment_id,
    orderid as order_id,
    created,
    status,
    amount

from {{ source('stripe', 'payment') }}
