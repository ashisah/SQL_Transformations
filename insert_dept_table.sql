INSERT INTO department(dept_name)
SELECT DISTINCT(dept_name)
FROM employees;
