-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
	ON e.emp_no = s.emp_no;
	
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') LIKE '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM dept_manager dm
JOIN employees e
	ON dm.emp_no = e.emp_no
JOIN departments d
	ON dm.dept_no = d.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW emp_dept_table AS (
	SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp de
	JOIN employees e
		ON de.emp_no = e.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
);
SELECT *
FROM emp_dept_table;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT *
FROM emp_dept_table
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT *
FROM emp_dept_table
WHERE dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS lastname_count
FROM employees
GROUP BY last_name
ORDER BY lastname_count DESC;