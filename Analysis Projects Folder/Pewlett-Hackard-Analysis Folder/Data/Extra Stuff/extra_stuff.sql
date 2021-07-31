-- 1. Total population by department
SELECT DISTINCT ON (ed.emp_no) ed.emp_no,
	ed.dept_no,
	ed.to_date
INTO add_info_dept
FROM emp_dept AS ed
ORDER BY ed.emp_no;

-- 2. Total population by title
SELECT DISTINCT ON (t.emp_no) t.emp_no,
	t.title,
	t.to_date
INTO add_info_titles
FROM titles AS t
ORDER BY t.emp_no;

-- 3. All employees
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
ORDER BY aid.emp_no;
----------------------------
-- 4. Total retirees by department
SELECT DISTINCT ON (ed.emp_no) ed.emp_no,
	ed.dept_no,
	ed.to_date,
	e.birth_date
INTO add_retiree_info_dept
FROM emp_dept AS ed
	LEFT JOIN employees AS e
		ON ed.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND ed.to_date = '9999-01-01'
ORDER BY ed.emp_no;

-- 5. Retiree population by title (use add_info_titles table)

-- 6. All retirees
SELECT (arid.emp_no), arid.dept_no,
	d.dept_name,
	ait.title,
	arid.to_date,
	arid.birth_date
INTO add_info_retiree_employees
FROM add_retiree_info_dept AS arid
	LEFT JOIN add_info_titles AS ait
		ON arid.emp_no = ait.emp_no
	LEFT JOIN departments AS d
		ON arid.dept_no = d.dept_no
ORDER BY arid.emp_no;
-------------------------------------