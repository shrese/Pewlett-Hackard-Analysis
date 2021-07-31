
-- Total population by department
SELECT DISTINCT ON (ed.emp_no) ed.emp_no,
	ed.dept_no,
	ed.to_date
INTO add_info_dept
FROM emp_dept AS ed
ORDER BY ed.emp_no;

-- Retiree population by title
SELECT DISTINCT ON (t.emp_no) t.emp_no,
	t.title,
	t.to_date
--INTO add_info_titles
FROM titles AS t
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY t.emp_no;

-- All retirees
SELECT (aid.emp_no), aid.dept_no,
	d.dept_name,
	ait.title,
	ait.to_date
--INTO add_info_total_employees
FROM add_info_dept AS aid
	LEFT JOIN add_info_titles AS ait
		ON aid.emp_no = ait.emp_no
	LEFT JOIN departments AS d
		ON aid.dept_no = d.dept_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY aid.emp_no;

