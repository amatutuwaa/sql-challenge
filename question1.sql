select * from "Employees";

select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
	   t1.sex,
	   t2.salary
from "Employees" as t1
	join "Salaries" as t2
	using(emp_no);