-- Total population by department and title
SELECT e.emp_no, 
	t.title,
	t.to_date,
--INTO add_info_for_challenge
FROM employees AS e
	LEFT JOIN titles AS t
		ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) r.emp_no,
	r.title,
	r.to_date
--INTO unique_titles
FROM retirement_titles AS r
ORDER BY r.emp_no, r.to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(first_name), u.title 
--INTO retiring_titles
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
--INTO mentorship_eligibilty
FROM employees AS e
	LEFT JOIN emp_dept AS d
		ON e.emp_no = d.emp_no
	LEFT JOIN titles AS t
		ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;