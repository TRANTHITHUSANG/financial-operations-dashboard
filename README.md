# Financial Operations Dashboard

## 1. Project Overview

This project analyzes financial transaction data to monitor operational performance and identify key trends across transaction volume, transaction status, turnaround time (TAT), SLA performance, and departments.

The project demonstrates the use of **SQL Server and Power BI** to transform raw transaction data into an interactive financial operations dashboard.

---

## 2. Business Objectives

The main objectives of this project are to:

* Monitor overall transaction volume and processing status.
* Compare transaction performance between July and August 2026.
* Analyze transaction volume by department.
* Monitor Average TAT and SLA Rate.
* Identify pending transactions and potential operational bottlenecks.
* Provide a dashboard for management-level performance monitoring.

---

## 3. Dataset

The dataset contains simulated financial operations transactions with the following fields:

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

> **Note:** The dataset is created for portfolio and analytical practice purposes and does not contain real customer information.

---

## 4. Tools & Technologies

* **SQL Server** – Data storage, querying and analysis
* **SQL** – Data validation, transformation and KPI preparation
* **Power BI** – Data visualization and dashboard development
* **DAX** – KPI calculations and time-based analysis
* **Microsoft Excel** – Supporting data preparation
* **Git/GitHub** – Version control and project documentation

---

## 5. SQL Analysis

SQL was used to prepare and analyze the transaction data before visualization.

Key analyses include:

* Transaction volume by month
* Completed vs. Pending transactions
* Transaction amount by transaction type
* Transaction volume by department
* Average TAT by department
* SLA performance analysis
* Duplicate Transaction ID validation
* July vs. August performance comparison

---

## 6. Key Performance Indicators

The Power BI dashboard tracks five main operational KPIs:

| KPI                    | Description                                     |
| ---------------------- | ----------------------------------------------- |
| Total Transactions     | Total number of transactions processed          |
| Completed Transactions | Number of successfully completed transactions   |
| Pending Transactions   | Number of transactions still pending            |
| Average TAT            | Average turnaround time in hours                |
| SLA Rate               | Percentage of transactions processed within SLA |

---

## 7. Power BI Dashboard

The dashboard provides an overview of financial operations performance and allows users to analyze transaction trends across different dimensions.

### Dashboard Components

* KPI Cards
* July vs. August comparison
* Transaction status analysis
* Transaction volume by department
* Transaction type analysis
* Average TAT
* SLA performance
* Interactive filters and slicers

### Dashboard Preview

![Financial Operations Dashboard](screenshots/dashboards.png)

📄 [View Dashboard PDF](reports/Financial_Operations_Dashboard.pdf)

---

## 8. Key Insights

### Transaction Volume

August recorded **50 transactions**, representing a **25% increase** from July's 40 transactions. The increase indicates a higher operational workload during August and provides a basis for evaluating whether processing performance was able to keep pace with the additional transaction volume.

### Completion Performance

Completed transactions increased from **32 in July to 43 in August**, representing a **34.4% increase**. The completion rate also improved from **80.0% to 86.0%**, indicating that the operations team was able to process a larger proportion of transactions despite the increase in overall workload.

### Pending Transactions

Pending transactions decreased from **8 to 7**, a **12.5% reduction**, even though total transaction volume increased by 25%. This suggests improved transaction resolution and processing capacity, with fewer transactions remaining outstanding at the end of the period.

### SLA Performance

The **SLA Rate improved from 75% in July to 88% in August**, an increase of **13 percentage points**. The improvement indicates stronger adherence to defined service-level targets and suggests that processing efficiency improved alongside the higher transaction volume.

### Turnaround Time

Average TAT decreased from **3.21 hours in July to 2.43 hours in August**, representing a **24.3% reduction**. The shorter processing time, combined with the higher completion rate and improved SLA performance, indicates an overall improvement in operational efficiency.

### Department Performance

**Credit Ops** experienced the largest increase in transaction volume, rising from **12 transactions in July to 22 in August**, an **83.3% increase**.

In contrast, **Trade Finance remained stable at 17 transactions**, while **Loan Ops remained unchanged at 11 transactions**.

This indicates that the majority of the overall increase in transaction volume was driven by Credit Ops, making it the key department contributing to the higher operational workload in August.

### Overall Insight

Overall, August demonstrated **stronger operational performance despite a higher workload**. Transaction volume increased by **25%**, while completed transactions grew by **34.4%**, pending transactions decreased by **12.5%**, SLA Rate improved by **13 percentage points**, and Average TAT decreased by **24.3%**.

The significant increase in Credit Ops volume was the main driver of the additional workload, while the improvement in completion, SLA, and TAT metrics suggests that the operation was able to handle the increased demand more efficiently.

---

## 9. Project Structure

```text
financial-operations-dashboard/
│
├── README.md
│
├── screenshots/
│   └── dashboards.png
│
├── power bi/
│   └── Financial_Operations_Dashboard.pbix
│
├── reports/
│   └── Financial_Operations_Dashboard.pdf
│
└── sql/
    ├── 01. create_database.sql
    ├── 02. create_table.sql
    ├── 03. insert july_data.sql
    ├── 04. insert august_data.sql
    ├── 05. analysis_queries.sql
    ├── analysis_data.sql
    ├── draft.sql
    └── README.md
```

---

## 10. Skills Demonstrated

### Technical Skills

* SQL Server
* SQL querying & data analysis
* Data validation & data transformation
* DAX
* Power BI
* Microsoft Excel
* Git/GitHub

### Analytical Skills

* KPI development
* Month-over-month analysis
* SLA & TAT analysis
* Transaction performance analysis
* Department performance analysis
* Business insight generation

### Domain Knowledge

* Financial operations
* Transaction processing
* Credit operations
* Loan operations
