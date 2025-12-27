-- Donnez les morceaux de Rock dont les artistes sont en France
{{ config(materialized='view', tags=['question9']) }}

SELECT 
    t.NAME AS track_name
FROM {{ source('examen_dbt_schema', 'Track') }} t
JOIN {{ source('examen_dbt_schema', 'Genre') }} g ON t.GENREID = g.GENREID
JOIN {{ source('examen_dbt_schema', 'Album') }} a ON t.ALBUMID = a.ALBUMID
JOIN {{ source('examen_dbt_schema', 'Artist') }} ar ON a.ARTISTID = ar.ARTISID
WHERE g.NAME = 'Rock' AND ar.COUNTRY = 'France'