INSERT INTO country(country_name)
SELECT DISTINCT(country)
FROM employees;
