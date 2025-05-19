-- C1 age and gender
SELECT 
    "Age_Group",
    "Gender",
    "Category",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_spending,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data_features
GROUP BY 
    "Age_Group", "Gender", "Category"
ORDER BY 
    "Age_Group", "Gender", total_revenue DESC;

-- C2 seasons preference by demographic
SELECT 
    "Age_Group",
    "Gender",
    "Season",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase
FROM 
    sales_data_features
GROUP BY 
    "Age_Group", "Gender", "Season"
ORDER BY 
    "Age_Group", "Gender", total_revenue DESC;

-- C3 discount responsiveness
SELECT 
    "Age_Group",
    "Gender",
    "Has_Discount",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data_features
GROUP BY 
    "Age_Group", "Gender", "Has_Discount"
ORDER BY 
    "Age_Group", "Gender", "Has_Discount";

-- C4 high value customer
SELECT 
    "Age_Group",
    "Gender",
    "Region",
    COUNT(*) AS customer_count,
    AVG("Previous Purchases") AS avg_previous_purchases,
    AVG("Purchase Amount (USD)") AS avg_spending,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data_features
WHERE 
    "High_Value_Customer" = 1
GROUP BY 
    "Age_Group", "Gender", "Region"
ORDER BY 
    total_revenue DESC;