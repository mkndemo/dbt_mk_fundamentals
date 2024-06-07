SELECT 
    userId,
    SUM(CASE WHEN completed THEN 1 ELSE 0 END) AS completed_tasks,
    SUM(CASE WHEN NOT completed THEN 1 ELSE 0 END) AS incomplete_tasks
FROM {{ ref('stg_sample_external') }}
GROUP BY userId
ORDER BY userId