-- Donnez le genre de musique le plus écouté dans les années 2000
{{ config(materialized='view', tags=['question7']) }}

SELECT 
    g.NAME AS genre_name,
    COUNT(t.TRACKID) AS nb_tracks
FROM {{ source('examen_dbt_schema', 'Genre') }} g
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON g.GENREID = t.GENREID
JOIN {{ source('examen_dbt_schema', 'Album') }} a ON t.ALBUMID = a.ALBUMID
WHERE a.PRODYEAR BETWEEN 2000 AND 2009
GROUP BY g.NAME
ORDER BY nb_tracks DESC
LIMIT 1