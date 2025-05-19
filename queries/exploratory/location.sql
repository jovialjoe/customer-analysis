-- Purchase patterns by location
SELECT 
    "Location",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    COUNT(DISTINCT "Customer ID") AS unique_customers
FROM 
    sales_data
GROUP BY 
    "Location"
ORDER BY 
    total_revenue DESC;

-- Category popularity by location
SELECT 
    "Location",
    "Category",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Location", "Category"
ORDER BY 
    "Location", total_revenue DESC;