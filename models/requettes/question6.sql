-- Donnez le nombre de morceaux produits par chaque artiste
{{ config(materialized='view', tags=['question6']) }}

SELECT 
    ar.NAME AS artist_name,
    COUNT(t.TRACKID) AS nb_tracks
FROM {{ source('examen_dbt_schema', 'Artist') }} ar
JOIN {{ source('examen_dbt_schema', 'Album') }} al ON ar.ARTISID = al.ARTISTID
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON al.ALBUMID = t.ALBUMID
GROUP BY ar.NAME