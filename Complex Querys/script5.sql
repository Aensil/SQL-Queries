/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */

TRUE

/* 2 */
FALSE

/* 3 */
TRUE

/* 4 */
select max(salary) as Maximum,
	min(salary) as Minimum,
	sum(salary) as Sum,
	round(avg (salary),0) as Average
from hr.employees;

/* 5 */
select job_id, max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, TRUNC(avg (salary),0) as Average
from hr.employees
GROUP BY job_id;

/* 6 */
select job_id, count(*)
from hr.employees
group by job_id;

b
select job_id, count(*)
from hr.employees
where job_id= 'IT_PROG'
group by job_id;

/* 7 */

select COUNT(manager_id) "Number of Managers"
from hr.DEPARTMENTS;

/* 8 */
select max(salary)-min(salary) as Difference
from hr.employees;

/* 9 */

select d.manager_id, MIN(e.salary)
from hr.EMPLOYEES E, hr.DEPARTMENTS d
WHERE d.manager_id = e.manager_id
GROUP BY d.manager_id
HAVING MIN(e.salary) >= 6000
ORDER BY 2 DESC;

/* 10 */
select count(*) total,
	sum(decode(to_char(hire_date, 'YYYY'),2005,1)) as "2005",
    sum(decode(to_char(hire_date, 'YYYY'),2006,1)) as "2006",
    sum(decode(to_char(hire_date, 'YYYY'),2007,1)) as "2007",
    sum(decode(to_char(hire_date, 'YYYY'),2008,1)) as "2008"
    from hr.employees;

/* 11 */

select job_id,
NVL(TO_CHAR(sum(decode(department_id, 20,salary))), '(null)')  "Dept 20",
NVL(TO_CHAR(sum(decode(department_id, 50,salary))), '(null)')  "Dept 50",
NVL(TO_CHAR(sum(decode(department_id, 80,salary))), '(null)')  "Dept 80",
NVL(TO_CHAR(sum(decode(department_id, 90,salary))), '(null)')  "Dept 90",
SUM(salary) total
from hr.EMPLOYEES
GROUP BY department_id, job_id
