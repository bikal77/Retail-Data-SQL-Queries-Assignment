WITH order_counts AS (
SELECT
o.order_id,
COUNT(op.product_id) AS product_count
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
GROUP BY o.order_id
)SELECT AVG(product_count) AS average_product_count,
MAX(product_count) AS max_product_count
FROM order_counts;
