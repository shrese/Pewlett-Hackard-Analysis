-- Deliverable 1
-- Create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955
-- Use the DISTINCT ON statement to create a table that contains the most recent title of each employee.
-- Then, use the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	LEFT JOIN titles AS t
		ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) r.emp_no,
	r.first_name,
	r.last_name,
	r.title,
	r.to_date
INTO unique_titles
FROM retirement_titles AS r
ORDER BY r.emp_no, r.to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(u.emp_no), u.title 
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY u.title;

-- Deliverable 2
-- Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
	LEFT JOIN emp_dept AS d
		ON e.emp_no = d.emp_no
	LEFT JOIN titles AS t
		ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;