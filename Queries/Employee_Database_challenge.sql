-- Deliverable 1: Retiring Employees

-- 1. Retrieve data from the Employees table.

SELECT e.emp_no,
	e.first_name,
	e.last_name,
-- 2. Retrieve data from Titles table.

	tl.title,
	tl.from_date,
	tl.to_date
-- 3. INTO clause

INTO retirement_titles
-- 4. Primary key

FROM employees AS e
LEFT JOIN titles AS tl
ON e.emp_no = tl.emp_no
-- 5. Dates between 1952 and 1955

WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
-- 6. Export table

-- 7. Check Sample table

-- 8. Copy DISTINCT ON from starter code

-- 9. Retrieve data

-- 10. DISTINCT ON
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
-- 11. Create new table with INTO clause

INTO unique_titles
FROM retirement_titles AS rt
-- 12. Sort the new table

ORDER BY rt.emp_no, rt.to_date DESC;

-- 13. Export table

-- 14. Check Sample Table

-- 15. Create second query for retiring workers and their titles

-- 16. Count the number of titles from new table.

SELECT COUNT(ut.emp_no), ut.title
-- 17. Make a 2nd new table.

INTO retiring_titles
FROM unique_titles AS ut
-- 18. Group the table by title and then sort

GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;
-- 19. Export table as csv

-- 20. Check Sample Table

-- 21. Save file

-- Deliverable 2 Mentorship Program

-- 1-3. Retrieve data from tables

-- 4. DISTINCT ON Statement

SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ttl.title
-- 5. Create table with INTO clause

INTO mentorship_eligibilty
FROM employees AS e
-- 6. Inner join first tables

INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
-- 7. Inner join next tables

INNER JOIN titles AS ttl
ON e.emp_no = tt.emp_no
-- 8. Filter data with the parameters

WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
-- 9. Order table

ORDER BY e.emp_no;
-- 10. Export table

-- 11. Confirm with sample image

-- Deliverable 3 Queries

-- Expanding the age bracket for retirees

SELECT e.emp_no,
	e.first_name,
	e.last_name,
    ttl.title,
    ttl.from_date,
    ttl.to_date
INTO retirement_titles_expanded
FROM employees AS e
LEFT JOIN titles AS ttl
ON e.emp_no = t tl.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1957-12-31'
ORDER BY e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rte.first_name,
	rte.last_name,
	rte.title
INTO unique_titles_expanded
FROM retirement_titles_expanded AS rte
ORDER BY rte.emp_no, rte.to_date DESC;

SELECT COUNT(ute.emp_no), ute.title
INTO retiring_titles_expanded
FROM unique_titles_expanded AS ute
GROUP BY ute.title
ORDER BY COUNT(ute.emp_no) DESC;







-- Expanding mentorship requirements with age to see if that allows more people to be trained
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ttl.title
INTO mentorship_eligibilty.expanded
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS ttl
ON e.emp_no = ttl.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1967-12-31'
ORDER BY e.emp_no;