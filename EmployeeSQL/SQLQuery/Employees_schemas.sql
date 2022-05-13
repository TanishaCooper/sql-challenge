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


