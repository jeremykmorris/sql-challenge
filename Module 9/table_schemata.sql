-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ypH82I
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dept_no" varchar(10),   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_title_id" varchar(10),   NOT NULL,
    "emp_no" int,   NOT NULL,
    "birth_Date" varchar(10),   NOT NULL,
    "first_name" varchar(20),   NOT NULL,
    "last_name" varchar(20),   NOT NULL,
    "sex" varchar(20),   NOT NULL,
    "hire_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int,   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_managers" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "title" (
    "title_id" int,   NOT NULL,
    "title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int,   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_managers" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_managers" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

