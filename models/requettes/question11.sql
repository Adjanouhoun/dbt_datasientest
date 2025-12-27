-- Donnez les playlist où figurent des morceaux d'artistes nés avant 1990
{{ config(materialized='view', tags=['question11']) }}

SELECT DISTINCT
    p.NAME AS playlist_name
FROM {{ source('examen_dbt_schema', 'Playlist') }} p
JOIN {{ source('examen_dbt_schema', 'PlaylistTrack') }} pt ON p.PLAYLISTID = pt.PLAYLISTID
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON pt.TRACKID = t.TRACKID
JOIN {{ source('examen_dbt_schema', 'Album') }} a ON t.ALBUMID = a.ALBUMID
JOIN {{ source('examen_dbt_schema', 'Artist') }} ar ON a.ARTISTID = ar.ARTISID
WHERE ar.BIRTHYEAR < 1990