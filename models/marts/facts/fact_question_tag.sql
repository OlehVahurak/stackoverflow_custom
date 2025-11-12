{{ config(
    materialized='table'
) }}

SELECT
    q.id AS question_id,
    t.tag_id
FROM {{ source('stackoverflow_raw_data', 'posts_questions') }} q,  -- <-- tu zmiana
UNNEST(SPLIT(q.tags, ';')) AS single_tag
JOIN {{ ref('dim_tags') }} t
    ON single_tag = t.tag_name
WHERE q.post_type_id = 1
  AND q.tags IS NOT NULL
