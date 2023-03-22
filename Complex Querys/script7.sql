/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */
SELECT location_id, street_address, state_province, country_name
FROM hr.LOCATIONS 
NATURAL JOIN  hr.COUNTRIES;

/* 2 */
select e.last_name, e.department_id, d.department_name
from hr.employees e
    join hr.departments d
    on e.department_id = d.department_id;

/* 3 */
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM hr.EMPLOYEES e
    JOIN hr.DEPARTMENTS d   ON (e.department_id = d.department_id)
    JOIN hr.LOCATIONS l ON (d.location_id = l.location_id)
WHERE l.city = 'Toronto';

/* 4 */
select e.last_name as Employee, e.employee_id as EMP#,
    m.last_name as Manager, m.manager_id as Mgr#
from hr.employees e
    join hr.employees m
    on e.manager_id = m.manager_id;

/* 5 */
select e.last_name as Employee, e.employee_id as EMP#,
    m.last_name as Manager, m.manager_id as Mgr#
from hr.employees e
    left outer join hr.employees m
    on e.manager_id=m.manager_id
    order by 2;

/* 6 */

SELECT e.department_id DEPARMENT, e.first_name EMPLOYEE, em.first_name COLLEGUE
FROM hr.EMPLOYEES e
    JOIN hr.EMPLOYEES em ON (e.department_id = em.department_id)
WHERE e.first_name <> em.first_name;

/* 8 */
select em.last_name, em.hire_date
from hr.employees em 
join 
hr.employees emp
on (emp.last_name = 'Davies')
where emp.hire_date < em.hire_date



/* 9 */
SELECT e.last_name, e.hire_date, em.last_name, em.hire_date
FROM hr.EMPLOYEES e
	JOIN hr.EMPLOYEES em ON (e.department_id = em.department_id)
WHERE em.employee_id = e.manager_id
AND e.hire_date < em.hire_date;
