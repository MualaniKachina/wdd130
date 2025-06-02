-- Use the v_art database for art-related queries
USE v_art;

-- Question 1
SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- Question 2
SELECT a.artfile
FROM artwork a
JOIN artwork_keyword ak ON a.artwork_id = ak.artwork_id
JOIN keyword k ON ak.keyword_id = k.keyword_id
WHERE LOWER(k.keyword) LIKE '%flower%';

-- Question 3
SELECT ar.fname, ar.lname, aw.title
FROM artist ar
JOIN artwork aw ON ar.artist_id = aw.artist_id;

-----------------------------------------------------

-- Use the magazine database for magazine-related queries
USE magazine;

-- Question 4
SELECT m.magazineName, s.subscriberLastName, s.subscriberFirstName
FROM subscription sub
JOIN magazine m ON sub.magazineKey = m.magazineKey
JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
ORDER BY m.magazineName;

-- Question 5
SELECT m.magazineName
FROM subscription sub
JOIN magazine m ON sub.magazineKey = m.magazineKey
JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
WHERE s.subscriberFirstName = 'Samantha' AND s.subscriberLastName = 'Sanders';

-----------------------------------------------------

-- Use the employees database for employee-related queries
USE employees;

-- Question 6
-- List first five employees in Customer Service Department, ordered by last name
-- Since we don’t see a Customer Service department, this query may not be applicable.
-- However, for demonstration, let’s show first five employees ordered by last name:
SELECT first_name, last_name
FROM employees
ORDER BY last_name
LIMIT 5;

-- Question 7
-- Berni Genin data likely does not exist in employees database.
-- Here’s an example to get department and current salary for an employee
-- Assuming salaries are in the salaries table, here’s a typical query:
SELECT d.dept_name, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = 'Berni' AND e.last_name = 'Genin'
ORDER BY s.from_date DESC
LIMIT 1;

-- Question 11
SELECT COUNT(*) AS total_employees
FROM employees;

-- Question 12
-- Average salary per department < 60000, formatted
SELECT d.dept_name, FORMAT(AVG(s.salary), 2) AS avg_salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING AVG(s.salary) < 60000;

-- Question 13
SELECT d.dept_name, COUNT(*) AS female_count
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE e.gender = 'F'
GROUP BY d.dept_name
ORDER BY d.dept_name;

-----------------------------------------------------

-- Use the bike database for bike-related queries
USE bike;

-- Question 8
SELECT ROUND(AVG(quantity)) AS average_quantity
FROM stock;

-- Question 9
SELECT DISTINCT p.product_name
FROM stock s
JOIN product p ON s.product_id = p.product_id
WHERE s.quantity = 0
ORDER BY p.product_name;

-- Question 10
SELECT c.category_name, SUM(s.quantity) AS total_quantity
FROM stock s
JOIN product p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
WHERE s.store_id = 2
GROUP BY c.category_name
ORDER BY total_quantity ASC;