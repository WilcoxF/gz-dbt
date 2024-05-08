SELECT
    orders_id, 
    date_date, 
    ROUND(SUM(revenue), 2) AS total_revenue, 
    SUM(quantity) AS total_quantity, 
    ROUND(SUM(purchase_cost),2) AS total_pc, 
    ROUND(SUM(margin), 2) AS total_margin,
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id,date_date
ORDER BY orders_id

