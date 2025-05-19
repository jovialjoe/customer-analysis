-- DM1 finding low demand periods
SELECT 
    "Item Purchased",
    "Season",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_price,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data_features
GROUP BY 
    "Item Purchased", "Season"
ORDER BY 
    "Item Purchased", 
    purchase_count ASC;

-- DM2 comparing discount effectivneess
SELECT 
    "Item Purchased",
    "Season",
    "Has_Discount",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_price,
    SUM("Purchase Amount (USD)") AS total_revenue
FROM 
    sales_data_features
GROUP BY 
    "Item Purchased", "Season", "Has_Discount"
ORDER BY 
    "Item Purchased", "Season";

-- DM3 items with price insensitivity
SELECT 
    "Item Purchased",
    "Category",
    STDDEV("Purchase Amount (USD)") AS price_variation,
    AVG("Purchase Amount (USD)") AS avg_price,
    COUNT(*) AS purchase_count
FROM 
    sales_data_features
GROUP BY 
    "Item Purchased", "Category"
HAVING 
    COUNT(*) > 10
ORDER BY 
    price_variation ASC;