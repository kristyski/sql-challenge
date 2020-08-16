CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE
);

SELECT *
FROM employees
-- --------------------------
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR
);

SELECT *
FROM departments
-- --------------------------
DROP TABLE dept_emp;

-- ask Michael about id
CREATE TABLE dept_emp(
	id SERIAL,
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (id)
);

SELECT *
FROM dept_emp
-- --------------------------
DROP TABLE dept_manager;

-- does this table need a primary key?
CREATE TABLE dept_manager(
	id SERIAL,
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY (id)
);

SELECT *
FROM dept_manager
-- --------------------------
CREATE TABLE salaries(
	id SERIAL,
	emp_no INT,
	salary INT,
	PRIMARY KEY (id)
);

SELECT *
FROM salaries
-- --------------------------
DROP TABLE titles;

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR
);

SELECT *
FROM titles
-- --------------------------
-- join? why from salaries
CREATE VIEW empsal AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
s.emp_no=e.emp_no;

SELECT *
FROM empsal
-- --------------------------
CREATE OR REPLACE VIEW hired86 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
ORDER BY hire_date;

SELECT *
FROM hired86
-- --------------------------
CREATE VIEW allmanagers AS
SELECT first_name, last_name, hire_date
FROM employees

SELECT *
FROM allmanagers