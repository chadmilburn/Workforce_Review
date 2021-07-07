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

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

### Deep Dive into Analysis

1. Import the SQL database into Pandas. 

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<db_name>')
   connection = engine.connect()
   ```
2. Create a histogram to visualize the most common salary ranges for employees.

3. Create a bar chart of average salary by title.


