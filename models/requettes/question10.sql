-- Donnez la moyenne des tailles des morceaux par genre musical
{{ config(materialized='view', tags=['question10']) }}

SELECT 
    g.NAME AS genre_name,
    AVG(t.BITES) AS avg_size
FROM {{ source('examen_dbt_schema', 'Genre') }} g
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON g.GENREID = t.GENREID
GROUP BY g.NAME