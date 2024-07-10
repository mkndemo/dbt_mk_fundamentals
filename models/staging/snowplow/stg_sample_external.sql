with raw as (
    select parse_json(value) as user_tasks
    from {{ source('snowplow', 'event_ext_tbl') }}
),
extracted_data AS (
    SELECT 
        value:completed::BOOLEAN AS completed,
        value:id::INT AS id,
        value:title::STRING AS title,
        value:userId::INT AS userId
    FROM 
        raw, 
        LATERAL FLATTEN(input => user_tasks)
)
SELECT *
FROM extracted_data
