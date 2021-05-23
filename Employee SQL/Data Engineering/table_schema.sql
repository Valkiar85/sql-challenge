--DATA ENGINEERING

-- DROP TABLES IF EXIST

DROP TABLE IF EXISTS departments; 
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees; 
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp; 

-- Table 'departments' 
CREATE TABLE departments(
	dept_no VARCHAR(7) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(70) NOT NULL
);

-- Table 'titles' 
CREATE TABLE titles(
	title_id VARCHAR(7) PRIMARY KEY NOT NULL,
	title VARCHAR(70) NOT NULL
);

-- Table 'employees'
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL, 				
	emp_title VARCHAR(7) NOT NULL, 		
	birth_date DATE NOT NULL,
	first_name VARCHAR(70) NOT NULL,
	last_name VARCHAR(70) NOT NULL,
	sex VARCHAR(1) NOT NULL,			
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

--Table 'salaries'	
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL, 	
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Table 'dept_manager'
CREATE TABLE dept_manager(
	dept_no VARCHAR(7) NOT NULL,		
	emp_no INT NOT NULL,				
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Table 'dept_emp'
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(7) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);

-- CHECK TABLES WORK
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;