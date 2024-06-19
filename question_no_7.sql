SELECT 
    d.department,
    o.order_hour_of_day,
    COUNT(o.order_id) AS order_count
FROM 
    orders o
JOIN 
    order_products op ON o.order_id = op.order_id
JOIN 
    products p ON op.product_id = p.product_id
JOIN 
    departments d ON p.department_id = d.department_id
GROUP BY 
    d.department, o.order_hour_of_day
ORDER BY 
    d.department, o.order_hour_of_day;
