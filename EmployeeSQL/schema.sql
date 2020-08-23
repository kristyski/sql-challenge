DROP TABLE departments, dept_emp, dept_manager, employees, salaries, titles
CASCADE;

CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(4) NOT NULL UNIQUE,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    dept_emp_id SERIAL NOT NULL UNIQUE,
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_manager_id SERIAL NOT NULL UNIQUE,
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    salaries_id SERIAL NOT NULL UNIQUE,
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(5) NOT NULL UNIQUE,
    title VARCHAR(30) NOT NULL,
    PRIMARY KEY(title_id)
);

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

ALTER TABLE departments
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dept_emp(emp_no)
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
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES salaries(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_manager(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES employees(emp_title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_emp_id)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(hire_date)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;

ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
