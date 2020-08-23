-- 1.--------------------------
CREATE OR REPLACE VIEW empsal AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
s.emp_no=e.emp_no
ORDER BY salary;

SELECT *
FROM empsal
-- 2.--------------------------
CREATE OR REPLACE VIEW hired86 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
ORDER BY hire_date;

SELECT *
FROM hired86
-- 3.--------------------------
CREATE OR REPLACE VIEW allmanagers AS
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e ON
dm.emp_no = e.emp_no
INNER JOIN departments AS d on
d.dept_no = dm.dept_no
ORDER BY e.last_name;

SELECT *
FROM allmanagers
-- 4.--------------------------
CREATE OR REPLACE VIEW empdeptname AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON
de.emp_no = e.emp_no
INNER JOIN departments AS d on
d.dept_no = de.dept_no
ORDER BY e.last_name, e.first_name;

SELECT *
FROM empdeptname
-- 5.----------------
CREATE OR REPLACE VIEW hercb AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

SELECT *
FROM hercb
-- 6.--------------------------
CREATE OR REPLACE VIEW sales AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
e.emp_no = de.emp_no
WHERE dept_name = 'Sales'
ORDER BY e.last_name, e.first_name;

SELECT *
FROM sales
-- 7.----------------
CREATE OR REPLACE VIEW salesdvpt AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
e.emp_no = de.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY dept_name, e.last_name, e.first_name;

SELECT *
FROM salesdvpt
-- 8.----------------
CREATE OR REPLACE VIEW lastnames AS
SELECT employees.last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

SELECT *
FROM lastnames

-- Epilogue----------------
CREATE OR REPLACE VIEW epilogue AS
SELECT emp_no, first_name, last_name, sex
FROM employees
WHERE emp_no = 499942
ORDER BY last_name;

SELECT * FROM epilogue