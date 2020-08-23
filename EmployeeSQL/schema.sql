CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(4) UNIQUE,
    dept_name VARCHAR(30),
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(5) UNIQUE,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title_id VARCHAR(5),
	birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    dept_emp_id SERIAL NOT NULL UNIQUE,
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4),
    PRIMARY KEY(dept_emp_id)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
	dept_manager_id SERIAL NOT NULL UNIQUE,
	dept_no VARCHAR(4),
    emp_no INTEGER,
    PRIMARY KEY(dept_manager_id)
);

CREATE TABLE IF NOT EXISTS salaries
(
    salaries_id SERIAL NOT NULL UNIQUE,
    emp_no INTEGER,
    salary INTEGER,
    PRIMARY KEY(emp_no)
);

SELECT * FROM salaries

-- Create FKs
ALTER TABLE departments
    ADD FOREIGN KEY (dept_no)
    REFERENCES dept_emp(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE departments
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dept_manager(dept_no)
    MATCH SIMPLE
;
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_emp(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_manager(emp_no)
    MATCH SIMPLE
;

ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES salaries(emp_no)
    MATCH SIMPLE
;

ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES employees(emp_title_id)
    MATCH SIMPLE
;