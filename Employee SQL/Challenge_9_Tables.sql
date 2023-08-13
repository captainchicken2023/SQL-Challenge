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

ALTER TABLE titles
ALTER COLUMN title TYPE VARCHAR(50) USING title::VARCHAR(50);
ALTER TABLE titles
ALTER COLUMN title_id TYPE VARCHAR(5) USING title_id::VARCHAR(5);

ALTER TABLE employees 
ALTER COLUMN emp_title_id TYPE VARCHAR(5) USING emp_title_id::VARCHAR(5);
ALTER TABLE employees 
ALTER COLUMN first_name TYPE VARCHAR(50) USING first_name::VARCHAR(50);
ALTER TABLE employees 
ALTER COLUMN last_name TYPE VARCHAR(50) USING last_name::VARCHAR(50);
ALTER TABLE employees 
ALTER COLUMN sex TYPE CHAR(1) USING sex::CHAR(1);

ALTER TABLE dept_emp 
ALTER COLUMN dept_no TYPE VARCHAR(4) USING dept_no::VARCHAR(4);

ALTER TABLE departments 
ALTER COLUMN "dept_no" TYPE VARCHAR(4) USING "dept_no"::VARCHAR(4);
ALTER TABLE departments 
ALTER COLUMN "dept_name" TYPE VARCHAR(50) USING "dept_name"::VARCHAR(50);

ALTER TABLE dept_manager 
ALTER COLUMN dept_no TYPE VARCHAR(4) USING dept_no::VARCHAR(4);