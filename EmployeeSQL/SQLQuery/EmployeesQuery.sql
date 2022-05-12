-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6gzQ1W
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL PRIMARY KEY,
    "title" varchar   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL PRIMARY KEY,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL PRIMARY KEY,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "dept_emp" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL PRIMARY KEY,
    "salary" int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


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