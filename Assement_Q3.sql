WITH inflow_last_year AS (
    SELECT DISTINCT owner_id, transaction_date
    FROM savings_savingsaccount
    WHERE transaction_date >= CURDATE() - INTERVAL 365 DAY
		
)

SELECT 
    p.id AS plan_id,
    p.owner_id,
    p.name AS type,
    p.status_id, 
    (transaction_date) As last_transaction_date
FROM 
    plans_plan p
LEFT JOIN 
    inflow_last_year i ON p.owner_id = i.owner_id;
