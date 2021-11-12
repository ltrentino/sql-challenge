-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees as e
INNER JOIN salaries as s
	ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date LIKE '%/1986';

	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name , m.emp_no as manager_emp_no, e.last_name as manager_last_name, e.first_name as manager_first_name  FROM dept_manager as m
INNER JOIN departments as d
	ON m.dept_no = d.dept_no
INNER JOIN employees as e
	ON e.emp_no = m.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
 		-- 52245 rows returned
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- The following query looks for employees that work in either departments and it returns 137,952 rows
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Development' OR d.dept_name = 'Sales'  --  137952 work in Sales or Development

-- The following query looks for employees that work in both departments but it returns 0 rows, so it appears that no employees work both in Sales and in Development.
SELECT de.emp_no 
FROM dept_emp as de
	INNER JOIN 
		(SELECT de.emp_no 
		 FROM dept_emp as de
			INNER JOIN departments as d	ON d.dept_no = de.dept_no
		 WHERE d.dept_name = 'Sales') as s ON de.emp_no = s.emp_no
	INNER JOIN departments as d	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Development'
	
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) 
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC




----------- 
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = 499942



