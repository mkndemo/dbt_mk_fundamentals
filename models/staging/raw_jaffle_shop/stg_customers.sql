with customers_with_email as (
    select 
        id as customer_id,
        name as customer_name,
        email,
    from {{ source('raw_jaffle_shop', 'raw_customers') }}
),

final as (
    select
        customer_id,
        customer_name,
        email,
        CASE 
            WHEN REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN true
                ELSE false
            END AS email_valid
    
    from customers_with_email
)

select * from final