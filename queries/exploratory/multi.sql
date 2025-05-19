-- Age, gender and category
SELECT 
    CASE 
        WHEN "Age" < 30 THEN 'Under 30'
        WHEN "Age" BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    "Gender",
    "Category",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase
FROM 
    sales_data
GROUP BY 
    age_group, "Gender", "Category"
ORDER BY 
    age_group, "Gender", avg_purchase DESC;

-- Shipping type by purchase amount
SELECT 
    "Shipping Type",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Shipping Type"
ORDER BY 
    avg_purchase DESC;

-- Query relating state/location and season
SELECT 
    "Location",
    "Season",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    -- Calculate the percentage of total state revenue from each season
    (SUM("Purchase Amount (USD)") * 100.0 / 
        SUM(SUM("Purchase Amount (USD)")) OVER (PARTITION BY "Location")) 
        AS percent_of_state_revenue
FROM 
    sales_data
GROUP BY 
    "Location", "Season"
ORDER BY 
    total_revenue DESC;