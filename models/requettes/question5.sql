-- Donnez le nombre d'albums produits pour chaque artiste
{{ config(materialized='view', tags=['question5']) }}

SELECT 
    ar.NAME AS artist_name,
    COUNT(al.ALBUMID) AS nb_albums
FROM {{ source('examen_dbt_schema', 'Artist') }} ar
JOIN {{ source('examen_dbt_schema', 'Album') }} al ON ar.ARTISID = al.ARTISTID
GROUP BY ar.NAME