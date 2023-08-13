CREATE TABLE titles(
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE employees(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_iD) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL PRIMARY KEY, 
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL, 
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments(
	"dept_no" VARCHAR NOT NULL PRIMARY KEY, 
	"dept_name" VARCHAR NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
