-- Summary statistics of purchase amounts
SELECT 
    MIN("Purchase Amount (USD)") AS min_amount,
    MAX("Purchase Amount (USD)") AS max_amount,
    AVG("Purchase Amount (USD)") AS avg_amount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Purchase Amount (USD)") AS median_amount,
    STDDEV("Purchase Amount (USD)") AS std_dev_amount
FROM 
    sales_data;

-- Purchase amount distribution by ranges
SELECT 
    CASE 
        WHEN "Purchase Amount (USD)" BETWEEN 20 AND 50 THEN '$20-$50'
        WHEN "Purchase Amount (USD)" BETWEEN 50 AND 80 THEN '$50-$80'
        ELSE '$80-$100'
    END AS price_range,
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_amount
FROM 
    sales_data
GROUP BY 
    price_range
ORDER BY 
    avg_amount;

-- Top selling product categories
SELECT 
    "Category",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    AVG("Review Rating") AS avg_rating
FROM 
    sales_data
GROUP BY 
    "Category"
ORDER BY 
    total_revenue DESC;

-- Top individual items purchased
SELECT 
    "Item Purchased",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data
GROUP BY 
    "Item Purchased"
ORDER BY 
    purchase_count DESC
LIMIT 10;