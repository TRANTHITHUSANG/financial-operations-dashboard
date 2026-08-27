/* =========================================================
   PROJECT: Financial Operations Analysis
   FILE: 02_create_table.sql
   PURPOSE: Create Transactions table
   ========================================================= */

USE FinancialOperations;
GO

CREATE TABLE Transactions (
    Transaction_ID VARCHAR(10) PRIMARY KEY,
    Date DATE,
    Customer_ID VARCHAR(10),
    Transaction_Type VARCHAR(30),
    Amount DECIMAL(18,2),
    Currency VARCHAR(3),
    Status VARCHAR(20),
    TAT DECIMAL(5,2),
    Channel VARCHAR(20),
    Department VARCHAR(30)
);
GO

