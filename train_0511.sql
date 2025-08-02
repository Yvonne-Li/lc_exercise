with monthly_avg_bal as (
    select
    customer_id,
    date_trunc('month',opened_date) as month,
    avg(balance) as avg_bal
    from accounts
    group by customer_id,date_trunc('month',opened_date)
),
bal_changes as (
    select
    customer_id,
    month,
    avg_bal,
    lag(avg_bal) over (partition by customer_id order by month) as prev_bal
    from monthly_avg_bal
)

select customer_id,
month,
avg_bal,
prev_bal,
round((avg_bal-prev_bal)/COALESCE(prev_bal,0),2) as pct_change
from bal_changes