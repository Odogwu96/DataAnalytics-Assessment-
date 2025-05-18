SELECT distinct(u.id), concat(u.first_name,' ', u.last_name) as Name, count(case when p.is_regular_savings =1 then 1 end) as savings_count, count(case when p.is_a_fund = 1 then 1 end) as investment_count, sum(s.confirmed_amount) as total_deposits
FROM  users_customuser u 
join plans_plan p on u.id  = p.owner_id  
join savings_savingsaccount s on p.owner_id = s.owner_id  
group by u.id;

