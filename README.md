# 🧠 Stack Overflow Data Insights — Answer Gaps Analysis

[![Status](https://img.shields.io/badge/Status-Complete-success.svg)](https://github.com/YourUsername/YourRepo/actions)
[![Data Model](https://img.shields.io/badge/Model-Star_Schema-blue.svg)](./models/README.md)
[![Powered By](https://img.shields.io/badge/Powered_by-dbt_%7C_BigQuery-orange.svg)]()
[![License](https://img.shields.io/badge/License-MIT-green.svg)]()

## 📖 Introduction & Objective

This project simulates a technical data assessment focusing on the **Stack Overflow public dataset**. The goal is to identify topics (**tags**) that demonstrate the **highest need for answers**—the gap between demand and resolution.

The project showcases **production-minded data practices**, including:
* End-to-end data processing.
* **Dimensional Modeling** (Star Schema) in **BigQuery**.
* **dbt** for transformation and testing.
* **Looker Studio** for actionable insights.

The **Need for Answers (Demand Index)** is a **synthetic metric** combining **demand (views)** with the **lack of resolution (unanswered status)**.

---

## 🧩 Project Architecture: Star Schema

The data pipeline uses a robust dimensional model for reporting optimization. 

*Note: The analytical schema is a Star Schema with `fact_questions` as the central table, surrounded by `dim_users`, `dim_tags`, and `dim_time`.*

| Table | Type | Description |
| :--- | :--- | :--- |
| **`fact_questions`** | Fact | Central table capturing core question metrics (views, score, `is_answered`). |
| **`fact_question_tag`** | Bridge | Links questions to multiple tags (many-to-many). |
| **`dim_users`** | Dimension | User information and reputation. |
| **`dim_tags`** | Dimension | Tag metadata and usage frequency. |

---

## 🛠️ Data Quality & Key Metrics (dbt)

### Production Practices
* **Layered Architecture:** Models are structured into `staging`, `intermediate`, and `marts`.
* **Testing:** **`unique`** and **`not_null`** tests are enforced on all keys.
* **Documentation:** Comprehensive documentation is provided via **dbt docs**.

### Demand Metrics
The analysis is driven by the **Demand Index**:

$$\text{Demand Index} = \frac{\text{Total Views of Unresolved}}{\text{Unresolved Questions (is\_answered = 0)}}$$

---

## 📈 Insights Visualization (Looker Studio)

The analysis is presented in a Looker Studio dashboard:

* **Primary Visualization:** A **Scatter Chart** comparing **Unresolved Question Count** (X-Axis) vs. **Demand Index** (Y-Axis).
* **Insight:** Tags in the **upper-right quadrant** represent the greatest overlap of persistent problems and high user demand.
* **Report Access:** **[Insert Link to your public Looker Studio report]**

---

## 🚀 Getting Started

### Prerequisites
1.  Access to **Google BigQuery**.
2.  **dbt-bigquery** installed.

### Run Transformation
1.  Configure **`profiles.yml`** locally.
2.  Install dependencies: `dbt deps`
3.  Build the data model: `dbt build`

The analytical tables will be created in your target BigQuery dataset.
