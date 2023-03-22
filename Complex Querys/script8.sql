/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */
SELECT em.last_name, em.hire_date
FROM hr.EMPLOYEES em
WHERE em.department_id = (SELECT e.department_id FROM hr.EMPLOYEES e WHERE last_name = '&ENTER_NAME' AND e.employee_id <> em.employee_id)

/* 2 */
select employee_id, last_name, salary 
from hr.employees
where salary > (select avg(salary) from hr.employees)
order by salary asc;

/* 3 */
SELECT e.employee_id, e.last_name
FROM hr.EMPLOYEES e
WHERE e.department_id IN (SELECT em.department_id FROM hr.EMPLOYEES em WHERE em.last_name LIKE '%u%');

/* 4 */
select last_name, department_id, job_id
from hr.employees
where department_id in (select department_id from hr.departments where location_id = 1700);

/* 5 */
SELECT e.employee_id, e.last_name
FROM hr.EMPLOYEES e
WHERE e.department_id IN (SELECT em.department_id FROM hr.EMPLOYEES em WHERE em.last_name = 'King');

/* 6 */
select department_id, last_name, job_id
from hr.employees
where department_id in (select department_id from hr.departments where department_name = 'Executive');

/* 7 */
SELECT e.last_name
FROM hr.EMPLOYEES e
WHERE e.salary > (SELECT MIN(em.salary) FROM hr.employees em);

/* 8 */
select employee_id, last_name, salary
from hr.employees
where department_id in (select department_id from hr.employees where last_name like '%u%')
and salary > (select avg (salary) from hr.employees);