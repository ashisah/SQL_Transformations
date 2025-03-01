--average salary per department table
CREATE TABLE salary_to_department_analysis AS
SELECT 
    dept_id, 
    AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

ALTER TABLE salary_to_department_analysis
ADD CONSTRAINT fk_salary_to_department
FOREIGN KEY (dept_id) REFERENCES department(dept_id);

--average salary by year xp table
CREATE TABLE salary_to_tensure_analysis AS
SELECT 
    year_xp, 
    AVG(salary) AS avg_salary
FROM employees
GROUP BY year_xp;

--average salary by performance rating table
CREATE TABLE performance_by_salary_analysis AS
SELECT 
    perf_rating_id, 
    AVG(salary) AS avg_salary
FROM employees
GROUP BY perf_rating_id;

ALTER TABLE performance_by_salary_analysis
ADD CONSTRAINT fk_salary_to_performance
FOREIGN KEY (perf_rating_id) REFERENCES performance(perf_rating_id);

--additional query 1: percentage of high performers by department
--BQ: is there a bias in performance rating by department?
CREATE TABLE high_performers_by_department AS
WITH high_performers AS (
    SELECT perf_rating_id
    FROM performance
    WHERE perf_rating_name = 'High Performers'
)
SELECT 
    e.dept_id,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) AS high_performers_count,
    ROUND(
        COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS high_performers_percentage
FROM employees e
GROUP BY e.dept_id;

ALTER TABLE high_performers_by_department
ADD CONSTRAINT fk_high_performers_department
FOREIGN KEY (dept_id) REFERENCES department(dept_id);

--additional query 2: percentage of high performers by country
--BQ: is there a bias in performance rating by country?
CREATE TABLE high_performers_by_country AS
WITH high_performers AS (
    SELECT perf_rating_id
    FROM performance
    WHERE perf_rating_name = 'High Performers'
)
SELECT 
    e.country_id,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) AS high_performers_count,
    ROUND(
        COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS high_performers_percentage
FROM employees e
GROUP BY e.country_id;

ALTER TABLE high_performers_by_country
ADD CONSTRAINT fk_high_performers_country
FOREIGN KEY (country_id) REFERENCES country(country_id);

--additional query 3: avg_salary for high performers vs. avg salary by department
--BQ: how does higher performance boost salary per department?
CREATE TABLE high_performers_vs_regular_performers_analysis AS
WITH high_performers AS (
    SELECT perf_rating_id
    FROM performance
    WHERE perf_rating_name = 'High Performers'
)
SELECT 
    e.dept_id,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) AS high_performers_count,
    ROUND(
        COUNT(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS high_performers_percentage,
    ROUND(AVG(e.salary), 2) AS avg_salary_all_employees,
    ROUND(AVG(CASE WHEN e.perf_rating_id = (SELECT perf_rating_id FROM high_performers) THEN e.salary END), 2) AS avg_salary_high_performers
FROM employees e
GROUP BY e.dept_id;

ALTER TABLE high_performers_vs_regular_performers_analysis
ADD CONSTRAINT fk_high_performers_department
FOREIGN KEY (dept_id) REFERENCES department(dept_id);