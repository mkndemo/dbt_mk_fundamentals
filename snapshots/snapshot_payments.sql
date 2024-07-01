{% snapshot snapshots_payments %}

{{
    config(
      target_database='analytics',
      target_schema='staging',
      unique_key='id',

      strategy='check',
      check_cols=['status'],
    )
}}

select * from {{ source('stripe', 'raw_payment') }}

{% endsnapshot %}