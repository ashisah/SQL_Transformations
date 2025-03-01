INSERT INTO department(dept_name)
SELECT DISTINCT(dept_name)
FROM employees;

INSERT INTO country(country_name)
SELECT DISTINCT(country)
FROM employees;

INSERT INTO performance(perf_rating_name)
SELECT DISTINCT(performance_rating)
FROM employees;