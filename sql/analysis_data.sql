/* =========================================================
   PROJECT: Financial Operations Analysis
   FILE: 04_analysis.sql
   PURPOSE: Operational performance analysis
   DATABASE: FinancialOperations
   ========================================================= */

USE FinancialOperations;
GO


/* =========================================================
   SECTION 1 — DATA OVERVIEW
   ========================================================= */

-- 1. Total number of transactions

SELECT COUNT (*) AS Total_Transactions
FROM [dbo].[Transactions];

/* =========================================================
   SECTION 2 — STATUS ANALYSIS
   ========================================================= */

-- 2.1. Transaction volume by status
SELECT [Status]
      ,  COUNT (*) AS Transactions_Count
FROM [dbo].[Transactions]
GROUP BY [Status]
ORDER BY Transactions_Count DESC;

-- 2.2. Pending transactions with the highest TAT
-- Purpose: Identify pending transactions that may require attention
SELECT [Transaction_ID], [Date], [Customer_ID], [Transaction_Type], [Amount], [Currency], [Status], [TAT], [Department]
FROM [dbo].[Transactions]
WHERE [Status] = 'Pending'
ORDER BY [TAT] DESC;

-- 2.3. Total pending transactions
-- Purpose: Measure the current pending transaction volume

SELECT COUNT(*) AS Pending_Transactions
FROM [dbo].[Transactions]
WHERE [Status] = 'Pending';

-- 2.3. Completion & Pending Rate

SELECT 
      COUNT(*) AS Total_Transactions

    , SUM(CASE 
            WHEN [Status] = 'Completed' THEN 1 
            ELSE 0 
          END) AS Completed_Transactions

    , SUM(CASE 
            WHEN [Status] = 'Pending' THEN 1 
            ELSE 0 
          END) AS Pending_Transactions

    , ROUND(
        SUM(CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*)
      , 2) AS Completion_Rate

    , ROUND(
        SUM(CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*)
      , 2) AS Pending_Rate

FROM [dbo].[Transactions];

/* =========================================================
   SECTION 3 — KPI SUMMARY
   ========================================================= */

SELECT
      COUNT(*) AS Total_Transactions

    , SUM(CASE
            WHEN [Status] = 'Completed' THEN 1
            ELSE 0
          END) AS Completed_Transactions

    , SUM(CASE
            WHEN [Status] = 'Pending' THEN 1
            ELSE 0
          END) AS Pending_Transactions

    , ROUND(AVG(CAST([TAT] AS DECIMAL(10,2))), 2) AS Average_TAT

    , SUM(CASE
            WHEN [TAT] <= 4 THEN 1
            ELSE 0
          END) AS Within_SLA

    , SUM(CASE
            WHEN [TAT] > 4 THEN 1
            ELSE 0
          END) AS SLA_Breaches

    , ROUND(
        SUM(CASE WHEN [TAT] <= 4 THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS SLA_Rate

    , ROUND(
        SUM(CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS SLA_Breach_Rate

FROM [dbo].[Transactions];

/* =========================================================
   SECTION 4 - DEPARTMENT & TAT ANALYSIS
   ========================================================= */
   
   -- 4.1 Completed transaction with the lowest TAT by Department
-- Purpose: Identify the fastest completed transaction within each department

SELECT [Transaction_ID], 
        [Date], 
        [Customer_ID], 
        [Transaction_Type], 
        [Amount], 
        [Currency], 
        [Status], 
        [TAT]
FROM 
    (SELECT [Transaction_ID], 
        [Date], 
        [Customer_ID], 
        [Transaction_Type], 
        [Amount], 
        [Currency], 
        [Status], 
        [TAT],
        [Department],
        RANK () OVER (
            PARTITION BY [Department] 
            ORDER BY [TAT] ASC) AS Ranked_Transactions
FROM [dbo].[Transactions]
WHERE [Status] = 'Completed') AS Completed

WHERE Ranked_Transactions = 1;

-- 4.2. Average TAT & SLA Breach by Department

SELECT 
      [Department]

    , COUNT(*) AS Total_Transactions

    , SUM(CASE 
            WHEN [Status] = 'Completed' THEN 1 
            ELSE 0 
          END) AS Completed_Transactions

    , SUM(CASE 
            WHEN [Status] = 'Pending' THEN 1 
            ELSE 0 
          END) AS Pending_Transactions

    , ROUND(AVG(CAST([TAT] AS DECIMAL(10,2))), 2) AS Average_TAT

    , SUM(CASE 
            WHEN [TAT] > 4 THEN 1 
            ELSE 0 
          END) AS SLA_Breaches

    , ROUND(
        SUM(CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) 
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS SLA_Breach_Rate

FROM [dbo].[Transactions]

GROUP BY [Department]

ORDER BY Average_TAT DESC;


/* =========================================================
   SECTION 5 — TRANSACTION TYPE ANALYSIS
   ========================================================= */

SELECT 
      [Transaction_Type]

    , COUNT(*) AS Total_Transactions

    , ROUND(
        AVG(CAST([TAT] AS DECIMAL(10,2)))
      , 2) AS Average_TAT

    , SUM(CASE 
            WHEN [TAT] > 4 THEN 1 
            ELSE 0 
          END) AS SLA_Breaches

    , ROUND(
        SUM(CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) 
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS SLA_Breach_Rate

FROM [dbo].[Transactions]

GROUP BY [Transaction_Type]

ORDER BY Total_Transactions DESC;

/* =========================================================
   SECTION 6 — CHANNEL ANALYSIS
   ========================================================= */

SELECT
      [Channel]

    , COUNT(*) AS Total_Transactions

    , SUM(CASE
            WHEN [Status] = 'Completed' THEN 1
            ELSE 0
          END) AS Completed_Transactions

    , SUM(CASE
            WHEN [Status] = 'Pending' THEN 1
            ELSE 0
          END) AS Pending_Transactions

    , ROUND(
        SUM(CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS Completion_Rate

    , ROUND(
        AVG(CAST([TAT] AS DECIMAL(10,2)))
      , 2) AS Average_TAT

    , SUM(CASE
            WHEN [TAT] > 4 THEN 1
            ELSE 0
          END) AS SLA_Breaches

    , ROUND(
        SUM(CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0)
      , 2) AS SLA_Breach_Rate

FROM [dbo].[Transactions]

GROUP BY [Channel]

ORDER BY Completion_Rate DESC;


/* =========================================================
   SECTION 7 — SLA ANALYSIS
   ========================================================= */

  -- 7.1. SLA Breaches

SELECT 
      [Transaction_ID]
    , [Date]
    , [Customer_ID]
    , [Transaction_Type]
    , [Amount]
    , [Currency]
    , [Status]
    , [TAT]
    , [Channel]
    , [Department]

FROM [dbo].[Transactions]

WHERE [TAT] > 4

ORDER BY [TAT] DESC;


-- 7.2. Pending + SLA Breach

SELECT 
      [Transaction_ID]
    , [Date]
    , [Customer_ID]
    , [Transaction_Type]
    , [Amount]
    , [Currency]
    , [Status]
    , [TAT]
    , [Channel]
    , [Department]

FROM [dbo].[Transactions]

WHERE [Status] = 'Pending'
  AND [TAT] > 4

ORDER BY [TAT] DESC;

-- 7.3. Pending + SLA Breach Count

SELECT 
    COUNT(*) AS Pending_SLA_Breach_Count

FROM [dbo].[Transactions]

WHERE [Status] = 'Pending'
  AND [TAT] > 4;


/* =========================================================
   SECTION 8 — SLA ANALYSIS
   ========================================================= */

-- 8.1. Monthly KPI Summary

SELECT
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    COUNT(*) AS Total_Transactions,
    SUM(CASE 
        WHEN Status = 'Completed' THEN 1 
        ELSE 0 
    END) AS Completed_Transactions,
    SUM(CASE 
        WHEN Status = 'Pending' THEN 1 
        ELSE 0 
    END) AS Pending_Transactions,
    AVG(TAT) AS Average_TAT,
    CAST(
        SUM(CASE 
            WHEN TAT <= 3 THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS SLA_Rate
FROM Transactions
GROUP BY
    YEAR(Date),
    MONTH(Date)
ORDER BY
    Year,
    Month;

-- 8.2. July vs August Comparison

WITH Monthly_KPI AS
(
    SELECT
        YEAR(Date) AS Year,
        MONTH(Date) AS Month,
        COUNT(*) AS Total_Transactions,

        SUM(CASE 
            WHEN Status = 'Completed' THEN 1 
            ELSE 0 
        END) AS Completed_Transactions,

        SUM(CASE 
            WHEN Status = 'Pending' THEN 1 
            ELSE 0 
        END) AS Pending_Transactions,

        AVG(TAT) AS Average_TAT,

        CAST(
            SUM(CASE 
                WHEN TAT <= 3 THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
            AS DECIMAL(5,2)
        ) AS SLA_Rate

    FROM Transactions
    GROUP BY
        YEAR(Date),
        MONTH(Date)
)

SELECT
    July.Total_Transactions AS July_Total,
    August.Total_Transactions AS August_Total,

    August.Total_Transactions - July.Total_Transactions
        AS Total_Change,

    CAST(
        (August.Total_Transactions - July.Total_Transactions)
        * 100.0 / NULLIF(July.Total_Transactions, 0)
        AS DECIMAL(5,2)
    ) AS Total_Change_Pct,

    July.Completed_Transactions AS July_Completed,
    August.Completed_Transactions AS August_Completed,

    July.Pending_Transactions AS July_Pending,
    August.Pending_Transactions AS August_Pending,

    July.Average_TAT AS July_Avg_TAT,
    August.Average_TAT AS August_Avg_TAT,

    July.SLA_Rate AS July_SLA_Rate,
    August.SLA_Rate AS August_SLA_Rate

FROM Monthly_KPI July
JOIN Monthly_KPI August
    ON July.Year = August.Year
    AND July.Month = 7
    AND August.Month = 8;