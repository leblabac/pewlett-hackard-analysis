-- DELIVERABLE 1: The Number of Retiring Employees by Title
--Create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
-- Review data
SELECT * FROM retirement_titles

-- Create a Unique Titles table that contains the employee number, first and last name, and most recent title
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;
--Review for data
SELECT * FROM unique_titles

--Create a Retiring Titles table that contains the number of titles filled by employees who are retiring.
SELECT COUNT(u.emp_no),
u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- DELIVERABLE 2: The Employees Eligible for the Mentorship Program
-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
--Review for data
SELECT * FROM mentorship_eligibility
