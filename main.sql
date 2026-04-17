SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.salary AS emp_salary,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    d.dept_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > (SELECT AVG(salary) FROM Employees)
ORDER BY e.salary DESC;

SELECT 
    c.cust_name,
    c.region,
    COUNT(o.order_id) AS total_orders,
    SUM(od.quantity) AS total_items_bought,
    SUM(o.total_amount) AS grand_total_spent
FROM Customers c
LEFT JOIN Orders o ON c.cust_id = o.cust_id
LEFT JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY c.cust_id, c.cust_name, c.region
ORDER BY grand_total_spent DESC;
