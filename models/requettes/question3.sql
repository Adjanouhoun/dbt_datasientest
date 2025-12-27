-- Donnez le nom et le compositeur des morceaux de Rock et de Jazz
{{ config(materialized='view', tags=['question3']) }}

SELECT 
    t.NAME AS track_name,
    t.COMPOSER
FROM {{ source('examen_dbt_schema', 'Track') }} t
JOIN {{ source('examen_dbt_schema', 'Genre') }} g ON t.GENREID = g.GENREID
WHERE g.NAME IN ('Rock', 'Jazz')