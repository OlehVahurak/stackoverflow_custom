# Stack Overflow Data Insights

## Introduction

This project simulates a comprehensive technical data assessment, covering the entire analytical lifecycle from sourcing raw data to surfacing actionable insights. The focus is the **Stack Overflow public dataset**, aiming to pinpoint which topics (**tags**) demonstrate the **highest need for answers**—quantifying the gap between community demand and available resolution.

The core finding is driven by the **Demand Index**, a **synthetic metric** combining **views** with the **unresolved_questions**.

---

## 🧩 Project Architecture: Star Schema Design

The data pipeline employs a robust dimensional model to ensure optimal performance and query efficiency for reporting. The analytical schema is structured as a Star Schema, with `fact_questions` serving as the central table. 


![Diagram Star Schema Model](assets/star_schema_diagram.jpeg) 

| Table | Type | Description |
| :--- | :--- | :--- |
| **`fact_questions`** | Fact | Central table capturing core question metrics (views, score, `is_answered`). |
| **`fact_question_tag`** | Bridge | Links individual questions to multiple tags (many-to-many relationship). |
| **`dim_users`** | Dimension | User information, including authorship and reputation metrics. |
| **`dim_tags`** | Dimension | Tag metadata, names, and frequency of use across the platform. |
| **`dim_time`** | Dimension | Standard calendar dimension for analyzing question creation and activity dates. |

---


## 📈 Insights Visualization (Looker Studio)

The final analysis is presented in a Looker Studio dashboard:

* **Primary Visualization:** A **Scatter Chart** comparing **Unresolved Question Count** (X-Axis) vs. **Demand Index** (Y-Axis). 
* **Insight:** Tags situated in the **upper-right quadrant** represent the most significant overlap of persistent problems and high user demand.
* **Report Access:** **[Insert Link to your public Looker Studio report]**

---

## 🚀 Getting Started

To replicate the project and build the analytical tables in your environment:

### Prerequisites
1.  Access to **Google BigQuery**.
2.  **dbt-bigquery** installed locally (via pip).

### Run Transformation
1.  Configure your local **`profiles.yml`** file with your BigQuery credentials.
2.  Install dbt packages: `dbt deps`
3.  Build the data model: `dbt build`

The fully transformed analytical tables will be created in your target BigQuery dataset.
