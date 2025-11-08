🧠 Stack Overflow Data Insights — Answer Gaps Analysis
📖 Introduction

This project was developed as part of a technical data assessment simulating real-world delivery conditions.
It covers the full analytical lifecycle — from sourcing and modeling data, to building an analytical data model and visualizations that surface actionable insights.

The exercise focuses on the Stack Overflow public dataset, aiming to identify which topics (tags) show the highest need for answers.

The project demonstrates production-minded data practices including:

End-to-end data sourcing, transformation, and presentation

Dimensional data modeling (star schema) in BigQuery

dbt for data transformation and testing

Looker Studio for storytelling and insights visualization

🎯 Objective

Main question: Which Stack Overflow topics have the highest need for answers?

To answer this, the project analyzes questions, answers, users, and tags from the Stack Overflow public dataset and models them into an analytical schema optimized for reporting and exploration.

🧩 Project Architecture

The data pipeline follows a dimensional star schema approach:

Fact Tables

fact_questions — central fact table capturing each question’s key metrics (views, score, answers, etc.)

fact_question_tag — bridge table connecting questions to their tags (many-to-many relationship)

Dimension Tables

dim_users — author information and reputation metrics

dim_tags — tag metadata and usage frequency

dim_time — standard calendar dimension for creation and activity dates

Each table is designed with clear primary and foreign keys to support scalable analytical queries in Looker Studio and dbt tests.
