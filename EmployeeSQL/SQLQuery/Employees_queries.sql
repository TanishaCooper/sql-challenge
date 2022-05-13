
-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT EMPLOYEES.EMP_NO AS "EMP_NO", EMPLOYEES.LAST_NAME AS "LAST_NAME", EMPLOYEES.FIRST_NAME AS "FIRST_NAME", EMPLOYEES.SEX AS "SEX", 
CAST(SALARIES.SALARY AS MONEY) AS "SALARY"
FROM EMPLOYEES
JOIN SALARIES ON EMPLOYEES.EMP_NO = SALARIES.EMP_NO;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT FIRST_NAME AS "FIRST_NAME", LAST_NAME AS "LAST_NAME", HIRE_DATE AS "HIRE_DATE"
FROM EMPLOYEES
WHERE CAST(EMPLOYEES.HIRE_DATE AS VARCHAR) LIKE '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DEPT_MANAGER.DEPT_NO AS "DEPT_NO", DEPARTMENTS.DEPT_NAME AS "DEPT_NAME", DEPT_MANAGER.EMP_NO AS "EMP_NO", EMPLOYEES.LAST_NAME AS "LAST_NAME", 
EMPLOYEES.FIRST_NAME AS "FIRST_NAME"
FROM DEPT_MANAGER
JOIN DEPARTMENTS ON DEPT_MANAGER.DEPT_NO = DEPARTMENTS.DEPT_NO
JOIN EMPLOYEES ON DEPT_MANAGER.EMP_NO = EMPLOYEES.EMP_NO;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO AS "EMP_NO", EMPLOYEES.LAST_NAME AS "LAST_NAME", EMPLOYEES.FIRST_NAME AS "FIRST_NAME", DEPARTMENTS.DEPT_NAME AS "DEPT_NAME"
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
and LAST_NAME LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO AS "EMP_NO", EMPLOYEES.LAST_NAME AS "LAST_NAME", EMPLOYEES.FIRST_NAME AS "FIRST_NAME", DEPARTMENTS.DEPT_NAME AS "DEPT_NAME"
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE DEPARTMENTS.DEPT_NAME = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO AS "EMP_NO", EMPLOYEES.LAST_NAME AS "LAST_NAME", EMPLOYEES.FIRST_NAME AS "FIRST_NAME", DEPARTMENTS.DEPT_NAME AS "DEPT_NAME"
FROM EMPLOYEES
JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE (DEPARTMENTS.DEPT_NAME = 'Sales'
or DEPARTMENTS.DEPT_NAME = 'Development');

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT LAST_NAME AS "LAST NAME", count(LAST_NAME) AS "FREQUENCY SHARED LAST NAME"
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY "FREQUENCY SHARED LAST NAME" DESC;