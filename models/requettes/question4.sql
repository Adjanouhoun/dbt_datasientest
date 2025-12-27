-- Donnez les 10 albums les plus longs
{{ config(materialized='view', tags=['question4']) }}

SELECT 
    a.TITLE,
    SUM(t.MILLISECONDS) AS total_duration
FROM {{ source('examen_dbt_schema', 'Album') }} a
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON a.ALBUMID = t.ALBUMID
GROUP BY a.TITLE
ORDER BY total_duration DESC
LIMIT 10