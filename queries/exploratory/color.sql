-- Color preferences
SELECT 
    "Color",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Color"
ORDER BY 
    purchase_count DESC;

-- Color preferences by gender
SELECT 
    "Gender",
    "Color",
    COUNT(*) AS purchase_count
FROM 
    sales_data
GROUP BY 
    "Gender", "Color"
ORDER BY 
    "Gender", purchase_count DESC;