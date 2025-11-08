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
    -- Użyj CAST, jak to zrobiłeś, do tworzenia flagi INT64
    CAST((q.accepted_answer_id IS NOT NULL) AS INT64) AS is_answered,
    CAST((q.accepted_answer_id IS NULL) AS INT64) AS is_unanswered_flag -- Dodaj flagę dla niewykonanych (unanswered)
FROM {{ source('stackoverflow_raw', 'posts_questions') }} q
LEFT JOIN {{ ref('dim_time') }} dt -- Używamy ref() do wymiaru czasu
    ON DATE(q.creation_date) = dt.full_date
WHERE q.post_type_id = 1

