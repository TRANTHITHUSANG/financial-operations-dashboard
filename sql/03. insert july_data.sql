/* =========================================================
   PROJECT: Financial Operations Analysis
   FILE: 03_insert_data.sql
   PURPOSE: Insert transaction data
   RECORDS: 40
   ========================================================= */

USE FinancialOperations;
GO

INSERT INTO Transactions
(
    Transaction_ID,
    Date,
    Customer_ID,
    Transaction_Type,
    Amount,
    Currency,
    Status,
    TAT,
    Channel,
    Department
)
VALUES
('TX001','2026-07-01','CUS001','Disbursement',500000000,'VND','Completed',2.1,'Branch','Credit Ops'),
('TX002','2026-07-01','CUS002','Repayment',120000000,'VND','Completed',1.2,'Online','Loan Ops'),
('TX003','2026-07-02','CUS003','Guarantee',300000000,'VND','Pending',5.4,'Branch','Trade Finance'),
('TX004','2026-07-02','CUS004','L/C',80000,'USD','Completed',3.2,'Branch','Trade Finance'),
('TX005','2026-07-03','CUS005','Disbursement',750000000,'VND','Completed',2.8,'Branch','Credit Ops'),
('TX006','2026-07-03','CUS006','Repayment',95000000,'VND','Completed',1.5,'Online','Loan Ops'),
('TX007','2026-07-04','CUS007','Guarantee',450000000,'VND','Completed',4.1,'Branch','Trade Finance'),
('TX008','2026-07-04','CUS008','TT',65000,'USD','Completed',2.7,'Online','Trade Finance'),
('TX009','2026-07-05','CUS009','Disbursement',320000000,'VND','Pending',6.2,'Branch','Credit Ops'),
('TX010','2026-07-05','CUS010','Repayment',180000000,'VND','Completed',1.1,'Online','Loan Ops'),
('TX011','2026-07-06','CUS011','Disbursement',900000000,'VND','Completed',3.5,'Branch','Credit Ops'),
('TX012','2026-07-06','CUS012','Guarantee',250000000,'VND','Completed',3.8,'Branch','Trade Finance'),
('TX013','2026-07-07','CUS013','L/C',120000,'USD','Pending',7.1,'Branch','Trade Finance'),
('TX014','2026-07-07','CUS014','Repayment',210000000,'VND','Completed',1.7,'Online','Loan Ops'),
('TX015','2026-07-08','CUS015','Disbursement',420000000,'VND','Completed',2.4,'Branch','Credit Ops'),
('TX016','2026-07-08','CUS016','TT',95000,'USD','Completed',2.3,'Online','Trade Finance'),
('TX017','2026-07-09','CUS017','Guarantee',600000000,'VND','Pending',5.9,'Branch','Trade Finance'),
('TX018','2026-07-09','CUS018','Repayment',135000000,'VND','Completed',1.3,'Online','Loan Ops'),
('TX019','2026-07-10','CUS019','Disbursement',680000000,'VND','Completed',2.6,'Branch','Credit Ops'),
('TX020','2026-07-10','CUS020','Repayment',155000000,'VND','Completed',1.4,'Online','Loan Ops'),
('TX021','2026-07-11','CUS021','Guarantee',375000000,'VND','Completed',4.4,'Branch','Trade Finance'),
('TX022','2026-07-11','CUS022','L/C',70000,'USD','Completed',3.0,'Branch','Trade Finance'),
('TX023','2026-07-12','CUS023','Disbursement',560000000,'VND','Completed',2.2,'Branch','Credit Ops'),
('TX024','2026-07-12','CUS024','Repayment',105000000,'VND','Pending',4.8,'Online','Loan Ops'),
('TX025','2026-07-13','CUS025','TT',110000,'USD','Completed',2.9,'Online','Trade Finance'),
('TX026','2026-07-13','CUS026','Disbursement',830000000,'VND','Completed',3.1,'Branch','Credit Ops'),
('TX027','2026-07-14','CUS027','Guarantee',290000000,'VND','Completed',3.6,'Branch','Trade Finance'),
('TX028','2026-07-14','CUS028','Repayment',145000000,'VND','Completed',1.6,'Online','Loan Ops'),
('TX029','2026-07-15','CUS029','Disbursement',470000000,'VND','Pending',5.2,'Branch','Credit Ops'),
('TX030','2026-07-15','CUS030','L/C',90000,'USD','Completed',3.4,'Branch','Trade Finance'),
('TX031','2026-07-16','CUS031','Repayment',220000000,'VND','Completed',1.2,'Online','Loan Ops'),
('TX032','2026-07-16','CUS032','Guarantee',520000000,'VND','Completed',4.0,'Branch','Trade Finance'),
('TX033','2026-07-17','CUS033','Disbursement',610000000,'VND','Completed',2.5,'Branch','Credit Ops'),
('TX034','2026-07-17','CUS034','TT',78000,'USD','Pending',6.5,'Online','Trade Finance'),
('TX035','2026-07-18','CUS035','Repayment',175000000,'VND','Completed',1.8,'Online','Loan Ops'),
('TX036','2026-07-18','CUS036','Disbursement',390000000,'VND','Completed',2.0,'Branch','Credit Ops'),
('TX037','2026-07-19','CUS037','Guarantee',410000000,'VND','Completed',3.9,'Branch','Trade Finance'),
('TX038','2026-07-19','CUS038','Repayment',130000000,'VND','Completed',1.5,'Online','Loan Ops'),
('TX039','2026-07-20','CUS039','Disbursement',720000000,'VND','Completed',2.7,'Branch','Credit Ops'),
('TX040','2026-07-20','CUS040','L/C',105000,'USD','Pending',5.7,'Branch','Trade Finance');

