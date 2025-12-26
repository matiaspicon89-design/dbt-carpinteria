WITH pedidos AS (
    SELECT 
        created_at,
        sale_price,
        status
    FROM {{ source('thelook_ecommerce', 'order_items') }}
)
SELECT 
    FORMAT_DATE('%Y-%m', created_at) AS mes,
    SUM(sale_price) AS ingresos_totales,
    COUNT(*) AS cantidad_pedidos
FROM pedidos
WHERE status is not null
GROUP BY 1
ORDER BY 1 DESC

