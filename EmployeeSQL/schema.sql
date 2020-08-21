DROP TABLE employees;

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