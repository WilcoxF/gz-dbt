SELECT 
    products_id,
    date_date
    , quantity
    , revenue
    , orders_id
    , CAST(purchase_price AS FLOAT64) AS purchase_price
    , ROUND(s.quantity * CAST(purchase_price AS FLOAT64),2) AS purchase_cost
    , ROUND(s.revenue - (s.quantity * CAST(purchase_price AS FLOAT64)),2) AS margin
FROM {{ ref('stg_raw__product')}} AS p
LEFT JOIN {{ ref('stg_raw__sales')}} AS s
    USING (products_id)