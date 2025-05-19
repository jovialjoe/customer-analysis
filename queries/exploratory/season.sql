-- Season popularity
SELECT 
    "Season",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase
FROM 
    sales_data
GROUP BY 
    "Season"
ORDER BY 
    total_revenue DESC;