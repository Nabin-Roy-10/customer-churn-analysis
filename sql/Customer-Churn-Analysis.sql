# sql queries to analyse the data

# Q1. What is the total number of customers?
# mysql> SELECT COUNT(DISTINCT customerid) AS total_customers_number FROM customer_churn_data;
# +------------------------+
# | total_customers_number |
# +------------------------+
# |                    521 |
# +------------------------+
  
# Q2. What is the overall churn rate?
mysql> SELECT ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate FROM customer_churn_data;
+------------+
| churn_rate |
+------------+
|      26.30 |
+------------+
  
# Q3. How many customers churned by contract type?
mysql> SELECT contract_type, COUNT(customerid) AS churned_customer FROM customer_churn_data GROUP BY contract_type;
+---------------+------------------+
| contract_type | churned_customer |
+---------------+------------------+
| Annual        |              254 |
| Monthly       |              267 |
+---------------+------------------+

# Q4. What is the churn rate by subscription type?
mysql> SELECT subscription_type, ROUND(SUM(churn_flag) * 100 / COUNT(*), 2) AS churn_rate FROM customer_churn_data GROUP BY subscription_type;
+-------------------+------------+
| subscription_type | churn_rate |
+-------------------+------------+
| Referral          |      29.35 |
| Paid              |      23.64 |
| Organic           |      25.58 |
+-------------------+------------+

# Q5. What is the average tenure of churned vs active customers?
mysql> SELECT CASE
    -> WHEN churn_flag = 0 THEN 'Not Churned'
    -> WHEN churn_flag = 1 THEN 'Churned'
    -> END as churn_status,
    -> ROUND(AVG(tenure_years), 2) AS average_tenure
    -> FROm customer_churn_data GROUP BY churn_flag;
+--------------+----------------+
| churn_status | average_tenure |
+--------------+----------------+
| Not Churned  |           4.64 |
| Churned      |           1.68 |
+--------------+----------------+

# Q6. What is the total revenue from active vs churned customers?
mysql> SELECT CASE
    -> WHEN churn_flag = 0 THEN 'Not Churned'
    -> When churn_flag = 1 THEN 'Churned'
    -> END AS churn_status,
    -> ROUND(SUM(monthly_charges) * 12, 2) AS annual_revenue
    -> FROM customer_churn_data GROUP BY churn_flag;
+--------------+----------------+
| churn_status | annual_revenue |
+--------------+----------------+
| Not Churned  |       68831.04 |
| Churned      |       24872.64 |
+--------------+----------------+

# Q7. Which plan type has the highest churn rate?
mysql> SELECT plan_type, ROUND(SUM(churn_flag) * 100 / COUNT(*), 2) AS churn_rate FROM customer_churn_data GROUP BY plan_type;
+-----------+------------+
| plan_type | churn_rate |
+-----------+------------+
| Standard  |      26.60 |
| Premium   |      28.91 |
| Basic     |      24.21 |
+-----------+------------+

# Q8. What is the churn rate by age group?
mysql> SELECT age_group, ROUND(SUM(churn_flag)*100 / COUNT(*), 2) AS churn_rate FROM customer_churn_data GROUP BY age_group;
+-----------+------------+
| age_group | churn_rate |
+-----------+------------+
| 36-45     |      26.53 |
| 26-35     |      30.28 |
| 46-55     |      24.11 |
| 18-25     |      23.19 |
| 56-65     |      26.19 |
+-----------+------------+
# Q9. How does churn vary by tenure group?
mysql> SELECT
    -> tenure_group,
    -> ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
    -> FROM customer_churn_data
    -> GROUP BY tenure_group
    -> ORDER BY churn_rate DESC;
+--------------+------------+
| tenure_group | churn_rate |
+--------------+------------+
| 0-1 years    |     100.00 |
| 1-3 years    |      41.50 |
| 3-5 years    |      12.50 |
| 5-7 years    |       3.73 |
| 7+ years     |       0.00 |
+--------------+------------+

# Q10. Do customers with complaints have a higher observed churn rate?
mysql> SELECT CASE
    -> WHEN complaint_count > 0 THEN 'With Complaints'
    -> ELSE 'Without Complaints'
    -> END AS complaint_status,
    -> COUNT(*) AS total_customers,
    -> SUM(churn_flag) AS churned_customers,
    -> ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
    -> FROM customer_churn_data GROUP BY complaint_status;
+--------------------+-----------------+-------------------+------------+
| complaint_status   | total_customers | churned_customers | churn_rate |
+--------------------+-----------------+-------------------+------------+
| Without Complaints |             339 |                80 |      23.60 |
| With Complaints    |             182 |                57 |      31.32 |
+--------------------+-----------------+-------------------+------------+    
# Q11. What is the average CSAT score for customers who churned vs remained active?
mysql> SELECT CASE
    -> WHEN churn_flag = 1 THEN 'Churned'
    -> WHEN churn_flag = 0 THEN 'Active'
    -> END AS customer_status,
    -> COUNT(*) AS total_customers,
    -> ROUND(AVG(avg_csat_score), 2) AS average_csat_score
    -> FROM customer_churn_data
    -> WHERE avg_csat_score IS NOT NULL GROUP BY churn_flag;
+-----------------+-----------------+--------------------+
| customer_status | total_customers | average_csat_score |
+-----------------+-----------------+--------------------+
| Churned         |              57 |              38.46 |
| Active          |             125 |              35.98 |
+-----------------+-----------------+--------------------+
# Q12. Which states have the highest number of churned customers?
mysql> SELECT
    -> state,
    -> COUNT(*) AS total_customers,
    -> SUM(churn_flag) AS churned_customers,
    -> ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
    -> FROM customer_churn_data
    -> GROUP BY state
    -> ORDER BY churned_customers DESC;
+---------------+-----------------+-------------------+------------+
| state         | total_customers | churned_customers | churn_rate |
+---------------+-----------------+-------------------+------------+
| Kathmandu     |              59 |                19 |      32.20 |
| Delhi         |              63 |                15 |      23.81 |
| Telangana     |              44 |                15 |      34.09 |
| Kerala        |              34 |                13 |      38.24 |
| Karnataka     |              32 |                10 |      31.25 |
| Uttar Pradesh |              39 |                10 |      25.64 |
| Meghalaya     |              24 |                 9 |      37.50 |
| Tamil Nadu    |              24 |                 7 |      29.17 |
| Punjab        |              27 |                 6 |      22.22 |
| Gujarat       |              23 |                 6 |      26.09 |
| Maharashtra   |              22 |                 5 |      22.73 |
| Nagaland      |              25 |                 5 |      20.00 |
| West Bengal   |              24 |                 5 |      20.83 |
| Bihar         |              31 |                 5 |      16.13 |
| Rajasthan     |              31 |                 4 |      12.90 |
| Odisha        |              19 |                 3 |      15.79 |
+---------------+-----------------+-------------------+------------+