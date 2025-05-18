WITH monthly_txn AS (
    SELECT 
        s.owner_id,
        DATE_FORMAT(s.transaction_date, '%Y-%m') AS monthly_txn,
        COUNT(*) AS monthly_txn_count
    FROM 
        savings_savingsaccount s
    GROUP BY 
        s.owner_id, DATE_FORMAT(s.transaction_date, '%Y-%m')
), 
avg_monthly_txn AS (
    SELECT 
        owner_id, 
        AVG(monthly_txn_count) AS avg_monthly_txn
    FROM 
        monthly_txn as m
    GROUP BY 
        owner_id
)
SELECT 
   CASE 
        WHEN a.avg_monthly_txn >= 10 THEN 'High Frequency'
        WHEN a.avg_monthly_txn BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    m.monthly_txn_count,
    a.avg_monthly_txn
    
FROM 
    avg_monthly_txn a
JOIN 
    monthly_txn m ON a.owner_id = m.owner_id
JOIN 
    users_customuser u ON u.id = a.owner_id
ORDER BY 
    a.avg_monthly_txn, m.monthly_txn_count DESC;
