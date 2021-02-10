# SQL Homework - Employee Database: A Mystery in Two Parts

## Background

Complete a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.


#### Data Modeling

Inspect the CSVs and sketch out an ERD of the tables. 
![ERD](images/employees_SQL_ERD)

#### Data Engineering

* Create a table schema for each of the six CSV files.

*Creation of SQL table 'departments'

```
CREATE TABLE departments (
    dept_no VARCHAR,
    dept_name VARCHAR(40)
);
```
* Import each CSV file into the corresponding SQL table.
![table import](images/import_data)

#### Data Analysis

Complete the following Queries:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
```
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no;
```
![Q1](images/Q1)

2. List first name, last name, and hire date for employees who were hired in 1986.
```
SELECT emp_no, first_name, last_name
FROM employees
WHERE hire_date between '1986-01-01' AND '1986-12-31'
```
![Q2](images/Q2)

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
```
SELECT d.dept_name, d.dept_no, m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
JOIN departments as d on m.dept_no = d.dept_no
JOIN employees as e on m.emp_no = e.emp_no;
```
![Q3](images/Q3)

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
```
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as p
join departments as d on p.dept_no = d.dept_no
join employees as e on p.emp_no = e.emp_no;
```
![Q4](images/Q4)

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
```
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
```
![Q5](images/Q5)

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
```
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as p
join employees as e on p.emp_no = e.emp_no
join departments as d on p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
```
![Q6](images/Q6)

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
```
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as p
join employees as e on p.emp_no = e.emp_no
join departments as d on p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';
```
![Q7](images/Q7)

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
```
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY 2 desc;
```
![Q8](images/Q8)

