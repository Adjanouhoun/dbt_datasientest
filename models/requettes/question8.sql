-- Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes
{{ config(materialized='view', tags=['question8']) }}

SELECT DISTINCT
    p.NAME AS playlist_name
FROM {{ source('examen_dbt_schema', 'Playlist') }} p
JOIN {{ source('examen_dbt_schema', 'PlaylistTrack') }} pt ON p.PLAYLISTID = pt.PLAYLISTID
JOIN {{ source('examen_dbt_schema', 'Track') }} t ON pt.TRACKID = t.TRACKID
WHERE t.MILLISECONDS > 240000