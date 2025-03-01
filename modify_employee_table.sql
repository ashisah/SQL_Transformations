--dept_id
ALTER TABLE employees
ADD COLUMN dept_id INT;

UPDATE employees
SET dept_id = department.dept_id
FROM department
WHERE employees.dept_name = department.dept_name;

ALTER TABLE employees
ADD CONSTRAINT fk_employees_department
FOREIGN KEY (dept_id) REFERENCES department(dept_id);

ALTER TABLE employees
DROP COLUMN dept_name;

--country_id
ALTER TABLE employees
ADD COLUMN country_id INT;

UPDATE employees
SET country_id = country.country_id
FROM country
WHERE employees.country = country.country_name;

ALTER TABLE employees
ADD CONSTRAINT fk_employees_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

ALTER TABLE employees
DROP COLUMN country;

--perf_rating_id

ALTER TABLE employees
ADD COLUMN perf_rating_id INT;

UPDATE employees
SET perf_rating_id = performance.perf_rating_id
FROM performance
WHERE employees.performance_rating = performance.perf_rating_name;

ALTER TABLE employees
ADD CONSTRAINT fk_employees_performance
FOREIGN KEY (perf_rating_id) REFERENCES performance(perf_rating_id);

ALTER TABLE employees
DROP COLUMN performance_rating;