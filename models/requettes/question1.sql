-- Donnez les titres des albums qui ont plus de 1 CD
{{ config(materialized='view', tags=['question1']) }}

SELECT 
    TITLE
FROM {{ source('examen_dbt_schema', 'Album') }}
WHERE CDYEAR > 1