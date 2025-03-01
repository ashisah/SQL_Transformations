INSERT INTO performance(perf_rating_name)
SELECT DISTINCT(performance_rating)
FROM employees;