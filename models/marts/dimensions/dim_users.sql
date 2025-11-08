{{ config(
    materialized='table'
) }}

SELECT
    id AS user_id,
    display_name,
    creation_date,
    last_access_date,
    reputation,
    location,
    up_votes,
    down_votes,
    views,
    profile_image_url,
    website_url
FROM {{ source('stackoverflow_raw', 'users') }}
