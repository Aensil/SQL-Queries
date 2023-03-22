/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */
SELECT last_name, salary
FROM hr.EMPLOYEES
WHERE salary > 12000;

/* 2 */
select last_name, department_id
from hr.employees
where employee_id=176;


/* 3 */
SELECT last_name, salary
FROM hr.EMPLOYEES
WHERE salary NOT BETWEEN 5000 AND 12000;

/* 4 */
select last_name, job_id, hire_date
from hr.employees
where last_name in('Matos', 'Taylor')
order by hire_date asc;

/* 5 */
SELECT last_name, department_id
FROM hr.EMPLOYEES
WHERE department_id IN (20, 50)
ORDER BY 1;

/* 6 */
select last_name as Employee, salary as Monthly_Salary
from hr.employees
where salary>=5000 and salary<=12000 
    and department_id=20 or department_id=50;

/* 7 */
SELECT last_name, hire_date
FROM hr.EMPLOYEES
WHERE EXTRACT(YEAR  FROM TO_DATE(hire_date, 'DD-MON-RR')) = 2006;

/* 8 */
select last_name, job_id
from hr.employees
where manager_id is null;

/* 9 */
SELECT last_name, salary, commission_pct
FROM hr.EMPLOYEES
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

/* 10 */
select last_name, salary
from hr.employees
where salary>12000;

/* 11 */
SELECT employee_id, last_name, salary, department_id
FROM hr.EMPLOYEES
WHERE manager_id = 103
ORDER BY 2;

/* 12 */
select last_name
from hr.employees
where last_name like '__a%';

/* 13 */
SELECT last_name
FROM hr.EMPLOYEES
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';

/* 14 */
SELECT last_name, job_id, salary
FROM hr.EMPLOYEES
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7500);

/* 15 */
SELECT last_name, salary, commission_pct
FROM hr.EMPLOYEES
WHERE commission_pct = 0.2;



