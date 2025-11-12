{{ config(
    materialized='table'
) }}

SELECT
    q.id AS question_id,
    q.owner_user_id,
    dt.time_id AS creation_time_id,
    q.accepted_answer_id,
    q.score,
    q.view_count,
    q.answer_count,
    q.comment_count,
    CAST((q.accepted_answer_id IS NOT NULL) AS INT64) AS is_answered
FROM {{ source('stackoverflow_raw_data', 'posts_questions') }} q
LEFT JOIN {{ ref('dim_time') }} dt
    ON DATE(q.creation_date) = dt.full_date
WHERE q.post_type_id = 1


