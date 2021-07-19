This repo exhibits my understanding of Data Modeling, Engineering and Analysis. Utilized ERD to create sketches of the database. These sketches were used then to build the tables with Primary and Foreign Key as well as additional constraints for analysis of the database. Utilized SQL to retrieve and analyze employee information in the newly built database. Finally using SQLAlchemy to creat visualiztions with the database.

# SQL - Employee Database

In this challenge, I designed tables to hold data from 6 CSVs, import the CSVs into a SQL database, and answer questions about the data preforming:

1. Data Modeling 

2. Data Engineering

3. Data Analysis

#### Data Analysis

List all employees in the Sales department, including their employee number, last name, first name, and department name.
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

### Deep Dive into Analysis

1. Import the SQL database into Pandas. 

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<db_name>')
   connection = engine.connect()
   ```
2. Create a histogram to visualize the most common salary ranges for employees.

3. Create a bar chart of average salary by title.


