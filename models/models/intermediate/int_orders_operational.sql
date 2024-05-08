SELECT
    o.orders_id, 
    o.date_date, 
    o.total_revenue,
    o.total_quantity,
    o.total_pc,
    o.total_margin,
    s.ship_cost,
    s.shipping_fee,
    s.logcost AS log_cost,
    ROUND(total_margin + shipping_fee - (logcost + ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS o
LEFT JOIN {{ ref('stg_raw__ship')}} AS s
    USING (orders_id)