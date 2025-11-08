{{ config(
    materialized='table'
) }}

SELECT
    id AS tag_id,
    tag_name,
    count
FROM {{ source('stackoverflow_raw', 'tags') }}
