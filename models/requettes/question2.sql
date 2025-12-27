-- Donnez les morceaux produits en 2000 ou en 2002
{{ config(materialized='view', tags=['question2']) }}

SELECT 
    t.NAME AS track_name
FROM {{ source('examen_dbt_schema', 'Track') }} t
JOIN {{ source('examen_dbt_schema', 'Album') }} a ON t.ALBUMID = a.ALBUMID
WHERE a.PRODYEAR IN (2000, 2002)