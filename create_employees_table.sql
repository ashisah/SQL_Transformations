CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
	name VARCHAR(75),
	age INT,
	dept_name VARCHAR(50),
	date_joined DATE,
	year_xp INT,
	country VARCHAR(50),
	salary BIGINT,
	performance_rating VARCHAR(50) CHECK (performance_rating IN ('Low Performers', 'Average Performers', 'High Performers'))
);
