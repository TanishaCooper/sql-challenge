## sql-challenge
# Employee Database: Historical Data Analysis

## Description
As a new data scientist, the challenge was a research project on Pewlett Hackard employees from the 19802 and 1990s using SQL: data modeling, data engineering, and data anlysis. The challenge utlizized data modeling, engineering, and analysis to build a SQL database with six tables. Using employee data from historical csv files, the database and tables were sucessfully imported.

## Data Engineering
 - Inspect CSV files
 - Design an ERD of the tables using QuickDBD
 - Export foundational Postgresql query from QuickDBD
 - Modify postgresql query to best align data types, primary keys, foreign keys, and other query contraints. 
 -- Identified composite keys, if primary key was not unique to table. Review table: dept_emp, dept_manager
 - Tables were created in the correct order to ensure table has correct foreign key
 <p align="center">
    <img src="https://github.com/TanishaCooper/sql-challenge/blob/main/EmployeeSQL/SQLQuery/Quick_Database.png", height="75%" width="75%">
 </p>
 
 - Import CSV files corresponding with how postgresql tables were created

## Data Analysis
- List the following details of each employee: employee number, last name, first name, sex, and salary
- List first name, last name, and hire date for employees who were hired in 1986
- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
- List the department of each employee with the following information: employee number, last name, first name, and department name
- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
- List all employees in the Sales department, including their employee number, last name, first name, and department name
- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
