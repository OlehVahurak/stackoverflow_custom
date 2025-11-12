{{ config(
    materialized='table'
) }}

WITH date_range AS (
  -- Użyj źródła posts_questions do ustalenia zakresu dat
  SELECT
    MIN(DATE(creation_date)) AS start_date,
    MAX(DATE(creation_date)) AS end_date
  FROM {{ source('stackoverflow_raw_data', 'posts_questions') }} 
),
all_dates AS (
  SELECT day
  FROM date_range,
  UNNEST(GENERATE_DATE_ARRAY(start_date, end_date)) AS day
)
SELECT
  CAST(FORMAT_DATE('%Y%m%d', day) AS INT64) AS time_id,
  day AS full_date,
  EXTRACT(YEAR FROM day) AS year,
  EXTRACT(MONTH FROM day) AS month,
  EXTRACT(DAY FROM day) AS day_of_month,
  EXTRACT(DAYOFWEEK FROM day) AS day_of_week,
  EXTRACT(QUARTER FROM day) AS quarter
FROM all_dates

