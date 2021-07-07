# SQL - Employee Database




In this challenge, I designed tables to hold data from 6 CSVs, import the CSVs into a SQL database, and answer questions about the data preforming:

1. Data Engineering

2. Data Analysis

#### Data Modeling

Inspect the CSVs and sketch out an ERD of the tables. Utilized Quick Database Diagrams to ccreate the ERD [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

#### Data Engineering

* Use the information you have to create a table schema for each of the six CSV files. Specified data types, primary keys, foreign keys, and other constraints.

  * Created tables in the correct order to handle foreign keys.

* Import each CSV file into the corresponding SQL table. 

#### Data Analysis

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

```
CREATE VIEW employee_info AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;
```

2. List first name, last name, and hire date for employees who were hired in 1986.
```
CREATE VIEW hires_1986 AS
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '01/01/1986' and '12/31/1986'
ORDER BY hire_date
```
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
```
CREATE VIEW department_managers AS
SELECT 
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
INNER JOIN dept_manager ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_manager.emp_no;
```
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
```
CREATE VIEW employee_departments AS
SELECT 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_emp.emp_no;
```
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
```
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';
```
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
```
CREATE VIEW sales_staff AS
SELECT 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_emp.emp_no
WHERE dept_name ='Sales';
```
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
```
CREATE VIEW sales_development AS
SELECT 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_emp.emp_no
WHERE dept_name IN ('Sales','Development');
```
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
```
CREATE VIEW last_name_counts AS
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;
```

### Deep Dive into Analysis

1. Import the SQL database into Pandas. 

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<db_name>')
   connection = engine.connect()
   ```
2. Create a histogram to visualize the most common salary ranges for employees.

3. Create a bar chart of average salary by title.


