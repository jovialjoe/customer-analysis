
-- RS1 regional, seasonal, category correlation
SELECT 
    "Region",
    "Season",
    "Category",
    COUNT(*) AS purchase_count,
    SUM("Purchase Amount (USD)") AS total_revenue,
    AVG("Purchase Amount (USD)") AS avg_purchase
FROM 
    sales_data_features
GROUP BY 
    "Region", "Season", "Category"
ORDER BY 
    "Region", total_revenue DESC;

-- RS2 top 3 sold products in state during season
WITH ranked_items AS (
    SELECT 
        "Location" AS state,
        "Season",
        "Item Purchased",
        COUNT(*) AS purchase_count,
        SUM("Purchase Amount (USD)") AS total_revenue,
        RANK() OVER (PARTITION BY "Location", "Season" ORDER BY SUM("Purchase Amount (USD)") DESC) AS revenue_rank
    FROM 
        sales_data_features
    GROUP BY 
        "Location", "Season", "Item Purchased"
)
SELECT 
    state,
    "Season",
    "Item Purchased",
    purchase_count,
    total_revenue
FROM 
    ranked_items
WHERE 
    revenue_rank <= 3  -- Top 3 items per state per season
ORDER BY 
    state, "Season", revenue_rank;
WITH seasonal_products AS (
    SELECT 
        "Season",
        "Item Purchased" AS product,
        COUNT(*) AS purchase_count,
        SUM("Purchase Amount (USD)") AS total_revenue,
        RANK() OVER (PARTITION BY "Season" ORDER BY SUM("Purchase Amount (USD)") DESC) AS revenue_rank
    FROM 
        sales_data_features
    GROUP BY 
        "Season", "Item Purchased"
)
SELECT 
    "Season",
    product,
    purchase_count,
    total_revenue
FROM 
    seasonal_products
WHERE 
    revenue_rank <= 3  -- Top 3 products per season
ORDER BY 
    "Season", revenue_rank;

-- RS 3seasonal performance by region
SELECT 
    "Region",
    "Category",
    "Season",
    COUNT(*) AS purchase_count,
    AVG("Purchase Amount (USD)") AS avg_purchase,
    SUM("Purchase Amount (USD)") AS total_revenue,
    SUM("Purchase Amount (USD)") / SUM(SUM("Purchase Amount (USD)")) OVER (PARTITION BY "Region", "Category") AS season_revenue_pct
FROM 
    sales_data_features
GROUP BY 
    "Region", "Category", "Season"
ORDER BY 
    "Region", "Category", total_revenue DESC;

-- RS6 for visual
WITH regional_products AS (
    SELECT 
        "Region",
        "Category",
        "Item Purchased" AS product,
        COUNT(*) AS purchase_count,
        SUM("Purchase Amount (USD)") AS total_revenue,
        AVG("Purchase Amount (USD)") AS avg_purchase,
        RANK() OVER (PARTITION BY "Region" ORDER BY SUM("Purchase Amount (USD)") DESC) AS product_rank
    FROM 
        sales_data_features
    GROUP BY 
        "Region", "Category", "Item Purchased"
)
SELECT
    "Region",
    product,
    "Category",
    purchase_count,
    total_revenue,
    avg_purchase,
    product_rank
FROM
    regional_products
WHERE
    product_rank <= 3  -- Top 3 products per region
ORDER BY
    "Region", product_rank;

--visual
SELECT 
    "Region",
    "Category",
    "Season",
    -- Create the combined Region-Category column
    "Region" || ' - ' || "Category" AS "Region_Category",
    SUM("Purchase Amount (USD)") AS total_revenue,
    SUM("Purchase Amount (USD)") / SUM(SUM("Purchase Amount (USD)")) OVER (PARTITION BY "Region", "Category") AS season_revenue_pct
FROM 
    sales_data_features
GROUP BY 
    "Region", "Category", "Season"
ORDER BY 
    "Region", "Category", total_revenue DESC;
