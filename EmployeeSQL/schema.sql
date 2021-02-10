
--creating a table schema for all 6 CSV files
CREATE TABLE departments (
    dept_no VARCHAR,
    dept_name VARCHAR(40)
);

CREATE TABLE dept_emp (
    emp_no INTEGER,
    dept_no VARCHAR
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INTEGER
);

CREATE TABLE employees (
    emp_no INTEGER,
    emp_title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR(1),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INTEGER,
    salary INTEGER
);

CREATE TABLE titles (
    title_id VARCHAR,
    title VARCHAR
);

---importing and verifying all the CSV
SELECT * FROM departments
