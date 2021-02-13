--List the following details of each employee: employee number, last name, first name, sex, and salary.
--Create View from query
CREATE VIEW employee_info AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;
--view the view
Select * FROM employee_info;
----------------------------------------------------------------------------------------------

--List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW hires_1986 AS
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '01/01/1986' and '12/31/1986'
ORDER BY hire_date

SELECT * FROM hires_1986
----------------------------------------------------------------------------------------------

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

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

SELECT * FROM department_managers
----------------------------------------------------------------------------------------------

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
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

SELECT * FROM employee_departments
----------------------------------------------------------------------------------------------

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

SELECT * FROM hercules_b
----------------------------------------------------------------------------------------------

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
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

SELECT * FROM sales_staff
----------------------------------------------------------------------------------------------

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
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

SELECT * FROM sales_development
----------------------------------------------------------------------------------------------

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW last_name_counts AS
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

SELECT * FROM last_name_counts
----------------------------------------------------------------------------------------------








