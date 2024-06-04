{{ dbt_utils.deduplicate(
    relation=ref('stg_sample_external'),
    partition_by='USERID',
    order_by="USERID desc",
   )
}}