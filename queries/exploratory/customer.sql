-- Purchasing patterns by age groups
SELECT 
    CASE 
        WHEN "Age" < 25 THEN 'Under 25'
        WHEN "Age" BETWEEN 25 AND 34 THEN '25-34'
        WHEN "Age" BETWEEN 35 AND 44 THEN '35-44'
        WHEN "Age" BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and above'
    END AS age_group,
    COUNT(*) AS customer_count,
    AVG("Purchase Amount (USD)") AS avg_spending,
    AVG("Review Rating") AS avg_rating
FROM 
    sales_data
GROUP BY 
    age_group
ORDER BY 
    avg_spending DESC;

-- Gender-based purchasing patterns
SELECT 
    "Gender",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_spending,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Gender";

-- Analysis by frequency of purchases
SELECT 
    "Frequency of Purchases",
    COUNT(*) AS customer_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    AVG("Previous Purchases") AS avg_previous_purchases
FROM 
    sales_data
GROUP BY 
    "Frequency of Purchases"
ORDER BY 
    avg_purchase DESC;

-- Subscription status impact
SELECT 
    "Subscription Status",
    COUNT(*) AS customer_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Subscription Status";