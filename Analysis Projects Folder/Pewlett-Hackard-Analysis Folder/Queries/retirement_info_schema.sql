--determine retirement eligibility 
--() is a tuple which are part of a syntax in SQL and groups the conditions
SELECT first_name, last_name
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--count the number of eligible employees
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1988-01-01' AND '1988-12-31');

--create a table based on the filtered information
SELECT first_name, last_name
INTO retirement_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info