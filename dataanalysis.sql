--- 1. List the employee number, last name, first name, sex, and salary of each employee.
select * from "Employees";

select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
	   t1.sex,
	   t2.salary
from "Employees" as t1
	join "Salaries" as t2
	using(emp_no);

--- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
select * from "Employees";

select first_name,
	   last_name,
	   hire_date
from "Employees"
where extract(year from hire_date)='1986'

--- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select t1.dept_no,
	   t2.dept_name,
	   t1.emp_no,
	   t3.last_name,
	   t3.first_name
from "Dept_Manager" as t1
	join "Departments" as t2 using(dept_no)
	join "Employees" as t3 using(emp_no)

--- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select t2.dept_no,
	   t3.dept_name,
	   t1.emp_no,
	   t1.last_name,
	   t1.first_name
from "Employees" as t1
	join "Dept_Emp" as t2 on t1.emp_no = t2.emp_no
	join "Departments" as t3 on t2.dept_no = t3.dept_no

--- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select last_name,
	   first_name,
	   sex
from "Employees"
where first_name = 'Hercules'
	and lower(last_name) LIKE 'b%'

--- 6. List each employee in the Sales department, including their employee number, last name, and first name.
select t1.emp_no,
	   t1.last_name,
	   t1.first_name
from "Employees" as t1
	join "Dept_Emp" as t2 on t1.emp_no = t2.emp_no
	join "Departments" as t3 on t2.dept_no = t3.dept_no
where t3.dept_name = 'Sales'

--- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
	   t3.dept_name
from "Employees" as t1
	join "Dept_Emp" as t2 on t1.emp_no = t2.emp_no
	join "Departments" as t3 on t2.dept_no = t3.dept_no
where t3.dept_name = 'Sales'
	or t3.dept_name = 'Development'

--- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,
	   count(*) as employees_count		
from "Employees"
group by 1
order by 2 DESC