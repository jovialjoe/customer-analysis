-- Payment method analysis
SELECT 
    "Payment Method",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Payment Method"
ORDER BY 
    purchase_count DESC;

-- Discount effect on purchases
SELECT 
    CASE WHEN "Discount Applied" = 'Yes' THEN 'Discounted' ELSE 'Full Price' END AS discount_status,
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    discount_status;

-- Promo code usage analysis
SELECT 
    CASE WHEN "Promo Code Used" IS NOT NULL AND "Promo Code Used" != 'No' THEN 'Used Promo' ELSE 'No Promo' END AS promo_usage,
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    promo_usage;