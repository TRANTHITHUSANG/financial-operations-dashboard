-- 4.Số giao dịch theo loại
SELECT [Transaction_Type]
    , COUNT (*) AS Transactions_Count
FROM [dbo].[Transactions]
GROUP BY [Transaction_Type]
ORDER BY Transactions_Count DESC

-- 5. Average TAT
SELECT AVG ([TAT]) AS Average_TAT_Hours
FROM [dbo].[Transactions]

-- 6. TAT theo Department
SELECT [Department]
    , COUNT (*) AS Transactions_Count
    , ROUND (AVG ([TAT]), 2) AS Average_TAT
FROM [dbo].[Transactions]
GROUP BY [Department]
ORDER BY Transactions_Count DESC

ROUND(AVG(TAT), 2) AS Average_TAT nghĩa là:
AVG(TAT) → tính TAT trung bình.
ROUND(..., 2) → làm tròn kết quả đến 2 chữ số thập phân.
AS Average_TAT → đặt tên cột kết quả là Average_TAT.

-- 7. Pending transactions => Tìm ra các giao dịch đang pending và có TAT cao
SELECT [Transaction_ID], [Date], [Customer_ID], [Transaction_Type], [Amount], [Currency], [Status], [TAT], [Department]
    , COUNT (*) AS Transactions_Count
FROM [dbo].[Transactions]
WHERE [Status] = 'Pending'
GROUP BY [Transaction_ID], [Date], [Customer_ID], [Transaction_Type], [Amount], [Currency], [Status], [TAT], [Department]
ORDER BY [TAT] DESC


-- 8. Số lượng giao dịch 'Pending'
SELECT COUNT (*) AS Transactions_Count
FROM [dbo].[Transactions]
WHERE [Status] = 'Pending'

-- 9. Giao dịch Completed có TAT thấp nhất theo từng Department -> HÀM SUB QUERY
SELECT [Transaction_ID], [Date], [Customer_ID], [Transaction_Type], [Amount], [Currency], [Status], [TAT]
FROM (SELECT [Transaction_ID], [Date], [Customer_ID], [Transaction_Type], [Amount], [Currency], [Status], [TAT], [Department]
    , RANK () OVER (PARTITION BY [Department] ORDER BY [TAT] ASC) AS Ranking 
FROM [dbo].[Transactions]
WHERE [Status] = 'Completed') AS t
WHERE Ranking  = 1

WHERE [Status] = 'Completed' → chỉ lấy giao dịch đã hoàn thành.
PARTITION BY [Department] → chia dữ liệu theo từng Department.
ORDER BY [TAT] ASC → sắp xếp TAT từ thấp → cao.
RANK() →xếp hạng giao dịch 
WHERE Ranking = 1 → lấy giao dịch có TAT thấp nhất của mỗi Department.

-- 10. Department Performance -> Đếm số (SUM CASE) giao dịch completed/pending theo TAT
SELECT [Department]
   , COUNT (*) AS Total_Transactions
   , SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) AS Completed
   , SUM (CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) AS Pending
   , ROUND (AVG ([TAT]), 2) AS Average_TAT
FROM [dbo].[Transactions]
GROUP BY [Department]
ORDER BY Average_TAT

-- 11. SLA Analysis -> TAT là 4h -> Phân loại (CASE) tạo ra text
SELECT COUNT (*) AS Transactions_Count
    , (CASE WHEN [TAT] <= 4 THEN 'Within SLA' ELSE 'Breach SLA' END) AS SLA_Status
FROM [dbo].[Transactions]
GROUP BY (CASE WHEN [TAT] <= 4 THEN 'Within SLA' ELSE 'Breach SLA' END)

-- 12. Tỷ lệ SLA -> SLA Rate = Within SLA / Total Transactions × 100
SELECT COUNT (*) AS Transactions_Count
    , SUM (CASE WHEN [TAT] <= 4 THEN 1 ELSE 0 END) AS Within_SLA
    , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS Breach_SLA
    , ROUND (((SUM (CASE WHEN [TAT] <= 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Rate
FROM [dbo].[Transactions]

=> 75% GIAO DỊCH WITHIN CHIẾM 3/4 TỔNG GIAO DỊCH

-- 13. Query KPI tổng hợp
SELECT COUNT (*) AS Transactions_Count

    , SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) AS Completed_Transactions
   , SUM (CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) AS Pending_Transactions
   
   , ROUND ((SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END)*100.0/COUNT (*)), 2) AS Completion_Rate

   , ROUND (AVG ([TAT]), 2) AS Average_TAT
   
   , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches

    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]

Status:
Completed: 32 -> Rate: 80
Pending: 8 -> Rate: 20
SLA within: 30 -> Rate: 75 
SLA breach: 10 -> Rate: 25


-- 14. Department Performance Analysis -> để tìm xem Credit Ops, Loan Ops hay Trade Finance đang xử lý chậm nhất và department nào có SLA breach cao nhất
SELECT [Department]
    , COUNT (*) AS Total_Transactions

    , SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) AS Completed_Transactions
   , SUM (CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) AS Pending_Transactions

   , ROUND (AVG ([TAT]), 2) AS Average_TAT
   
   , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches

    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]
GROUP BY [Department]
ORDER BY Average_TAT DESC

-- 15. Department có TAT cao nhất
SELECT TOP 1 [Department]
    , ROUND (AVG ([TAT]), 2) AS Average_TAT
FROM [dbo].[Transactions]
GROUP BY [Department]
ORDER BY Average_TAT DESC
=> Trade Finance

-- 16. Department có SLA Breach cao nhất
SELECT TOP 1 [Department]
    , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches
    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]
GROUP BY [Department]
ORDER BY SLA_Breach_Rate DESC

=> Trade Finance

Trade Finance recorded the highest average processing time and SLA breach rate, indicating a potential operational bottleneck in trade-related transactions.

-- 17.Transaction Type Analysis -> Loại giao dịch nào chiếm volume lớn nhất, loại nào xử lý chậm và loại nào có SLA breach cao?

-- THEO TRANSACTION TYPE
SELECT [Transaction_Type]
    , COUNT (*) AS Total_Transactions

    , SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) AS Completed_Transactions
   , SUM (CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) AS Pending_Transactions

   , ROUND (AVG ([TAT]), 2) AS Average_TAT
   
   , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches

    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]
GROUP BY [Transaction_Type]
ORDER BY Total_Transactions DESC

-- Chiếm volume lớn nhất
SELECT TOP 1 [Transaction_Type]
    , COUNT (*) AS Total_Transactions
FROM [dbo].[Transactions]
GROUP BY [Transaction_Type]
ORDER BY Total_Transactions DESC

-- Loại nào xử lý chậm nhất
SELECT TOP 1 [Transaction_Type]
    , COUNT (*) AS Total_Transactions
    , ROUND (AVG ([TAT]), 2) AS Average_TAT
FROM [dbo].[Transactions]
GROUP BY [Transaction_Type]
ORDER BY Total_Transactions DESC

-- Loại nào có SLA breach cao nhất
SELECT TOP 1 [Transaction_Type]
    , COUNT (*) AS Total_Transactions
    , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches
    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]
GROUP BY [Transaction_Type]
ORDER BY Total_Transactions DESC


--18. Channel Analysis (Branch vs Online)

SELECT [Channel]
    , COUNT (*) AS Total_Transactions

    , SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END) AS Completed_Transactions
   , SUM (CASE WHEN [Status] = 'Pending' THEN 1 ELSE 0 END) AS Pending_Transactions

   , ROUND (AVG ([TAT]), 2) AS Average_TAT
   
   , SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END) AS SLA_Breaches

    , ROUND (((SUM (CASE WHEN [TAT] > 4 THEN 1 ELSE 0 END))*100.0/COUNT (*)), 2) AS SLA_Breach_Rate
FROM [dbo].[Transactions]
GROUP BY [Channel]
ORDER BY Average_TAT DESC

-- 19. Completion Rate theo Channel

SELECT [Channel]
    , COUNT (*) AS Total_Transactionn
   , ROUND ((SUM (CASE WHEN [Status] = 'Completed' THEN 1 ELSE 0 END)*100.0/COUNT (*)), 2) AS Completion_Rate
FROM [dbo].[Transactions]
GROUP BY [Channel]

-- 20. Giao dịch chậm nhất
SELECT TOP 1 [Channel]
    , COUNT (*) AS Total_Transactions
    , ROUND (AVG ([TAT]), 2) AS Average_TAT
FROM [dbo].[Transactions]
GROUP BY [Channel]
ORDER BY Total_Transactions DESC

--21.5 giao djch chậm nhất
SELECT TOP 5 [Transaction_ID], [Transaction_Type], [Status], [TAT], [Channel], [Department]
FROM [dbo].[Transactions]
GROUP BY [Transaction_ID], [Transaction_Type], [Status], [TAT], [Channel], [Department]
ORDER BY [TAT] DESC

-- 22. Giao dịch đang Pending và đã vượt SLA

SELECT
    Transaction_ID,
    Date,
    Customer_ID,
    Transaction_Type,
    Channel,
    Department,
    TAT,
    Status
FROM Transactions
WHERE Status = 'Pending'AND TAT > 4
ORDER BY TAT DESC;

