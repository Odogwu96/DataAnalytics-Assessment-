## DataAnalytics-Assessment-
# 1. High-Value Customers with Multiple Products
    Joins key tables correctly i.e users_customuser, savings_savingsaccount on 'owner_id'
    Filters to customers who hold both account types using COUNT(CASE WHEN ...)` to count savings        and investment plans separately.
    Calculates meaningful summaries (plan count, deposits)
    Filtered users with both plan types using `HAVING`.

# 2. Transaction Frequency Analysis
    Created a CTE for both monthly transactions and avgerage monthly transactions
    Applied the frequncy model given 
  
# 3. Account Inactivity Alert
    Used a CTE to find users with any inflow transactions in the last year.
    Filtered out users with recent inflows using a LEFT JOIN and NULL check.

# 4.Customer Lifetime Value (CLV) Estimation
    Counted total transactions and summed their value.
    Calculated average profit per transaction (0.1% of transaction value).
    Estimated CLV using:
    CLV=(Total TransactionsTenure)×12×Avg Profit



 ## Challenges and Solutions
 # 1. Query Performance with Large Tables
    Challenge: Full table scans were expensive when counting per-user transactions.
    Solution: Used DISTINCT, CTEs, and filtered joins to minimize processing load.

#  2. Division by Zero in CLV Calculations
    Challenge: New users with 0 months of tenure caused division errors.
    Solution: Used NULLIF(tenure, 0) or CASE WHEN tenure > 0 to safely handle these cases.

# 3. Server Side Issues.
    Challenge: Timeout Occuring due to size of query
    Solution: Increased the timeout settings from MySQL workbench
