use companydb;
-- 1. View showing employee details along with branch name
CREATE VIEW employee_details AS
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    e.salary,
    b.branch_name
FROM employee e
JOIN branch b ON e.branch_id = b.branch_id;

-- 2. View showing total sales per employee
CREATE VIEW employee_sales_summary AS
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    SUM(w.total_sales) AS total_sales
FROM employee e
JOIN works_with w ON e.emp_id = w.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name;

-- 3. View showing clients with their associated branch name
CREATE VIEW client_branch_info AS
SELECT 
    c.client_id,
    c.client_name,
    b.branch_name
FROM client c
LEFT JOIN branch b ON c.branch_id = b.branch_id;

-- 4. View showing employees earning above 70000
CREATE VIEW high_earning_employees AS
SELECT 
    emp_id,
    first_name,
    last_name,
    salary
FROM employee
WHERE salary > 70000;

-- 5. View showing suppliers for each branch with supply type
CREATE VIEW branch_supplier_info AS
SELECT 
    bs.branch_id,
    b.branch_name,
    bs.supplier_name,
    bs.supply_type
FROM branch_supplier bs
JOIN branch b ON bs.branch_id = b.branch_id;

-- View all employee details with branch names
SELECT * FROM employee_details;
-- See employee sales performance
SELECT * FROM employee_sales_summary ORDER BY total_sales DESC;
-- See all clients and their associated branches
SELECT * FROM client_branch_info;
-- List of employees earning more than 70,000
SELECT * FROM high_earning_employees;
-- View all suppliers for each branch
SELECT * FROM branch_supplier_info;
