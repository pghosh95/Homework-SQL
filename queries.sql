-- Employee Details
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
LEFT JOIN salaries as s 
ON e.emp_no = s.emp_no;

-- Employees hired in 1986
SELECT emp_no, first_name, last_name
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31';

-- Department managers
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.to_date, dm.from_date
FROM dept_manager as dm
INNER JOIN departments as d
ON dm.dept_no = d.dept_no
INNER JOIN employees as e
ON dm.emp_no = e.emp_no;

-- Department for each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no;

-- Employees with first name Hercules and last name beginning with B
SELECT *
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- Employees in Sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Employees in Sales or Development department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- Frequency count of last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;