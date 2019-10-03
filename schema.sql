CREATE TABLE employees (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary INTEGER NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE titles (
	emp_no INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	title VARCHAR (30) NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL,
	PRIMARY Key (emp_no, from_date)
);

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL UNIQUE	
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR (4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);
