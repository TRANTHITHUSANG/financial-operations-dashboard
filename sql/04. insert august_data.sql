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

('TX041','2026-08-01','CUS041','Disbursement',700000000,'VND','Completed',1.8,'Branch','Credit Ops'),
('TX042','2026-08-01','CUS042','Repayment',135000000,'VND','Completed',1.1,'Online','Loan Ops'),
('TX043','2026-08-02','CUS043','Guarantee',380000000,'VND','Completed',3.2,'Branch','Trade Finance'),
('TX044','2026-08-02','CUS044','L/C',85000,'USD','Completed',2.6,'Branch','Trade Finance'),
('TX045','2026-08-03','CUS045','Disbursement',820000000,'VND','Completed',2.3,'Branch','Credit Ops'),

('TX046','2026-08-03','CUS046','Repayment',110000000,'VND','Completed',1.3,'Online','Loan Ops'),
('TX047','2026-08-04','CUS047','Guarantee',420000000,'VND','Pending',4.8,'Branch','Trade Finance'),
('TX048','2026-08-04','CUS048','TT',72000,'USD','Completed',2.2,'Online','Trade Finance'),
('TX049','2026-08-05','CUS049','Disbursement',650000000,'VND','Completed',2.0,'Branch','Credit Ops'),
('TX050','2026-08-05','CUS050','Repayment',175000000,'VND','Completed',1.4,'Online','Loan Ops'),

('TX051','2026-08-06','CUS051','Disbursement',950000000,'VND','Completed',2.7,'Branch','Credit Ops'),
('TX052','2026-08-06','CUS052','Guarantee',280000000,'VND','Completed',3.0,'Branch','Trade Finance'),
('TX053','2026-08-07','CUS053','L/C',115000,'USD','Pending',5.6,'Branch','Trade Finance'),
('TX054','2026-08-07','CUS054','Repayment',200000000,'VND','Completed',1.2,'Online','Loan Ops'),
('TX055','2026-08-08','CUS055','Disbursement',480000000,'VND','Completed',2.1,'Branch','Credit Ops'),

('TX056','2026-08-08','CUS056','TT',98000,'USD','Completed',2.4,'Online','Trade Finance'),
('TX057','2026-08-09','CUS057','Guarantee',550000000,'VND','Completed',3.1,'Branch','Trade Finance'),
('TX058','2026-08-09','CUS058','Repayment',145000000,'VND','Completed',1.5,'Online','Loan Ops'),
('TX059','2026-08-10','CUS059','Disbursement',730000000,'VND','Pending',5.1,'Branch','Credit Ops'),
('TX060','2026-08-10','CUS060','Repayment',165000000,'VND','Completed',1.3,'Online','Loan Ops'),

('TX061','2026-08-11','CUS061','Guarantee',400000000,'VND','Completed',2.8,'Branch','Trade Finance'),
('TX062','2026-08-11','CUS062','L/C',78000,'USD','Completed',2.5,'Branch','Trade Finance'),
('TX063','2026-08-12','CUS063','Disbursement',580000000,'VND','Completed',2.2,'Branch','Credit Ops'),
('TX064','2026-08-12','CUS064','Repayment',125000000,'VND','Completed',1.0,'Online','Loan Ops'),
('TX065','2026-08-13','CUS065','TT',105000,'USD','Completed',2.7,'Online','Trade Finance'),

('TX066','2026-08-13','CUS066','Disbursement',870000000,'VND','Completed',2.9,'Branch','Credit Ops'),
('TX067','2026-08-14','CUS067','Guarantee',310000000,'VND','Pending',4.5,'Branch','Trade Finance'),
('TX068','2026-08-14','CUS068','Repayment',190000000,'VND','Completed',1.6,'Online','Loan Ops'),
('TX069','2026-08-15','CUS069','Disbursement',520000000,'VND','Completed',2.3,'Branch','Credit Ops'),
('TX070','2026-08-15','CUS070','L/C',92000,'USD','Completed',2.8,'Branch','Trade Finance'),

('TX071','2026-08-16','CUS071','Repayment',155000000,'VND','Completed',1.2,'Online','Loan Ops'),
('TX072','2026-08-16','CUS072','Guarantee',470000000,'VND','Completed',3.0,'Branch','Trade Finance'),
('TX073','2026-08-17','CUS073','Disbursement',680000000,'VND','Pending',5.3,'Branch','Credit Ops'),
('TX074','2026-08-17','CUS074','TT',88000,'USD','Completed',2.1,'Online','Trade Finance'),
('TX075','2026-08-18','CUS075','Repayment',130000000,'VND','Completed',1.4,'Online','Loan Ops'),

('TX076','2026-08-18','CUS076','Disbursement',760000000,'VND','Completed',2.6,'Branch','Credit Ops'),
('TX077','2026-08-19','CUS077','Guarantee',360000000,'VND','Completed',2.9,'Branch','Trade Finance'),
('TX078','2026-08-19','CUS078','Repayment',180000000,'VND','Completed',1.5,'Online','Loan Ops'),
('TX079','2026-08-20','CUS079','Disbursement',640000000,'VND','Completed',2.4,'Branch','Credit Ops'),
('TX080','2026-08-20','CUS080','L/C',108000,'USD','Pending',4.9,'Branch','Trade Finance');

GO

