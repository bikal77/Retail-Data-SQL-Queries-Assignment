WITH product_reorders AS (
 SELECT op.product_id,
10
 p.product_name,
 COUNT(op.reordered) AS total_reorders,
 COUNT(DISTINCT o.user_id) AS unique_users
 FROM order_products op
 JOIN products p ON op.product_id = p.product_id
 JOIN orders o ON op.order_id = o.order_id
/* WHERE op.reordered = 1*/
 GROUP BY op.product_id, p.product_name
),
top_products AS (
 SELECT 
 product_id,
 product_name,
 total_reorders,
 unique_users
 FROM product_reorders
 ORDER BY total_reorders DESC
 LIMIT 3
)
SELECT 
 tp.product_id,
 tp.product_name,
 tp.total_reorders,
 tp.unique_users
FROM top_products tp
ORDER BY tp.unique_users DESC, tp.total_reorders DESC;