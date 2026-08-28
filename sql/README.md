# SQL Analysis – Financial Operations Dashboard

This folder contains the SQL scripts used to create, populate, validate, and analyze the financial transaction database for the **Financial Operations Dashboard** project.

---

## 1. SQL Workflow

```text
Create Database
      ↓
Create Table
      ↓
Insert Transaction Data
      ↓
Validate Data
      ↓
Analyze KPIs
      ↓
Power BI Dashboard
```

---

## 2. SQL Scripts

| File                         | Description                                                                       |
| ---------------------------- | --------------------------------------------------------------------------------- |
| `01. create_database.sql`    | Creates the Financial Operations database                                         |
| `02. create_table.sql`       | Creates the Transactions table and defines the data structure                     |
| `03. insert july_data.sql`   | Inserts simulated July 2026 transaction data                                      |
| `04. insert august_data.sql` | Inserts simulated August 2026 transaction data                                    |
| `05. analysis_queries.sql`   | Contains SQL queries for validation, KPI analysis, and July vs. August comparison |

---

## 3. Database Structure

The main `Transactions` table contains:

| Column           | Description                           |
| ---------------- | ------------------------------------- |
| Transaction_ID   | Unique transaction identifier         |
| Date             | Transaction date                      |
| Customer_ID      | Customer identifier                   |
| Transaction_Type | Type of financial transaction         |
| Amount           | Transaction amount                    |
| Currency         | Transaction currency                  |
| Status           | Transaction processing status         |
| TAT              | Turnaround time in hours              |
| Channel          | Transaction channel                   |
| Department       | Department responsible for processing |

---

## 4. SQL Analysis

The SQL analysis covers:

* Total transaction volume
* Completed vs. Pending transactions
* Transaction amount by transaction type
* Transaction volume by department
* Average TAT
* SLA performance
* Duplicate Transaction ID validation
* July vs. August comparison

---

## 5. Data Validation

SQL validation was performed to ensure data quality before connecting the dataset to Power BI.

Key validation checks include:

* Duplicate Transaction ID detection
* Transaction status validation
* Transaction volume verification
* Monthly transaction comparison
* KPI cross-checking

---

## 6. July vs. August Analysis

SQL queries were used to compare operational performance between July and August 2026.

Key metrics include:

| Metric                 |     July |   August |
| ---------------------- | -------: | -------: |
| Total Transactions     |       40 |       50 |
| Completed Transactions |       32 |       43 |
| Pending Transactions   |        8 |        7 |
| Completion Rate        |    80.0% |    86.0% |
| SLA Rate               |      75% |      88% |
| Average TAT            | 3.21 hrs | 2.43 hrs |

The SQL analysis provides the foundation for the KPIs and visualizations presented in the Power BI dashboard.

---

## 7. Notes

The dataset is simulated for portfolio and analytical practice purposes and does not contain real customer information.

The SQL scripts are designed to demonstrate practical skills in **SQL Server, data validation, KPI analysis, and operational performance analysis**.
