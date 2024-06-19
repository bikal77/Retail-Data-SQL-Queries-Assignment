SELECT p.product_id, p.product_name, COUNT(op.reordered) AS reorder_count
FROM order_products op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY reorder_count DESC
LIMIT 5;