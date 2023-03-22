/* Abdel Enoc Silva Escobar */

/* 1 */
SELECT e.first_name, e.last_name, e.department_id, j.start_date
FROM hr.employees e, hr.JOB_HISTORY j
WHERE e.employee_id = j.employee_id
ORDER BY e.department_id, j.start_date DESC;

/* 2 */
select employee_id,first_name,last_name, job_title, manager_id
from hr.EMPLOYEES, hr.JOBS
where  EMPLOYEES.job_id=JOBS.job_id;

/* 3 */

SELECT C.region_id, R.region_name, C.country_name
FROM hr.COUNTRIES C, hr.REGIONS R
WHERE C.region_id = R.region_id;

/* 4 */
select *
from hr.job_history;
select E.employee_id, E.first_name,E.last_name ,J.start_date,J.end_date
from hr.EMPLOYEES E, hr.JOB_HISTORY J
where  E.employee_id = J.employee_id;

/* 5 */

SELECT e.first_name, e.last_name, j.job_title, e.salary, e.commission_pct, NVL(e.commission_pct * e.salary,0), NVL(e.commission_pct * e.salary,0) + e.salary
FROM hr.employees e, hr.JOBS j
WHERE e.job_id = j.job_id;

/* 6 */
select E.employee_id, J.job_title, J.min_salary
from  hr.JOBS J, hr.EMPLOYEES E
where  J.job_title like '%Manager'
and E.employee_id=120 
OR E.employee_id=125
AND J.min_salary > 6000;

/* 7 */

SELECT l.location_id, l.city, d.department_name
FROM hr.DEPARTMENTS d, hr.LOCATIONS l
WHERE d.location_id = l.location_id
AND L.country_id <> 'US';

/* 8 */
select R.region_id, R.region_name,C.country_name
from  hr.COUNTRIES C, hr.REGIONS R
where  R.region_id=3;


/* 9 */

SELECT R.region_id, R.region_name, l.location_id, l.city, l.country_id, c.country_name
FROM hr.LOCATIONS l, hr.COUNTRIES c, hr.REGIONS r
WHERE l.COUNTRY_ID = c.COUNTRY_ID
AND c.region_id = r.region_id
AND l.location_id > 2400;

/* 10 */
select C.country_id,L.city, L.location_id,L.street_address , L.postal_code,
('codigo pais: '||C.country_id||' ciudad: '||L.city||' localizacion: '||L.location_id||' direccion: '||L.street_address ||' codigo postal: '||L.postal_code) as columna 
from  hr.COUNTRIES C, hr.LOCATIONS L, hr.REGIONS R
WHERE L.postal_code IS NOT NULL
and R.region_id=R.region_id;
and C.country_id=l.country_id;

/* 11 */

/* Promedio por  departamento*/
SELECT department_id, AVG(salary) promedio, COUNT(*), NVL(AVG(salary) || COUNT(*),0)
FROM hr.EMPLOYEES
WHERE department_id = 30
OR department_id = 80
GROUP BY department_id;

/* Promedio TOTAL*/
SELECT avg(salary)
FROM hr.EMPLOYEES
WHERE department_id = 30
OR department_id = 80;

/* 12 */
SELECT c.country_id, e.employee_id, e.first_name, e.last_name, c.country_name, r.region_name, l.state_province
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d, hr.LOCATIONS l, hr.COUNTRIES c, hr.REGIONS r, hr.JOBS j
WHERE e.DEPARTMENT_ID = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
AND j.job_title LIKE '%Manager%'
AND (c.country_id = 'US' OR c.country_id = 'UK')
AND (l.state_province = 'Washington' OR l.state_province = 'Oxford');
GROUP BY e.employee_id
ORDER BY e.first_name;


/* 13 */

SELECT e.first_name, e.last_name, c.country_name
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d, hr.LOCATIONS l, hr.COUNTRIES c
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.COUNTRY_ID = c.COUNTRY_ID
AND c.COUNTRY_NAME LIKE 'C%';

/* 14 */
SELECT  j.job_title, e.first_name, e.last_name, e.email
FROM hr.EMPLOYEES e,  hr.JOBS j
WHERE e.job_id=j.job_id
AND e.email='NKOCHHAR'
AND e.hire_date= '21-SEP-05';
select *
from hr.EMPLOYEES;

/* 15 */

SELECT e.first_name, e.last_name, e.department_id, e.hire_date, e.commission_pct
FROM hr.EMPLOYEES e
WHERE e.department_id IN (10,20,80)
AND current_date - e.hire_date > 180
AND e.commission_pct > 0.2
AND (e.first_name LIKE 'J%' or e.last_name LIKE 'J%');

/*
AND ((EXTRACT(YEAR  FROM TO_DATE(e.hire_date, 'DD-MON-RR')) IN 2022) AND (EXTRACT(MONTH  FROM TO_DATE(e.hire_date, 'DD-MON-RR')) < 10))
OR EXTRACT(YEAR  FROM TO_DATE(e.hire_date, 'DD-MON-RR')) < 2022;
*/

/* 16 */
SELECT e.first_name, e.last_name,D.department_name, e.phone_number
FROM hr.EMPLOYEES e, hr.DEPARTMENTS D
WHERE e.phone_number LIKE '515%'
AND LENGTH(e.phone_number) = 12;


/* 17 */
select (e.employee_id||', '||e.first_name||', '||e.last_name) as Nombre_completo, e.salary as Salario, d.department_id as Codigo_de_departamento, d.department_name as Titulo_Descripcion
from  hr.EMPLOYEES e, hr.DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.department_id
AND e.job_id like 'IT%'
ORDER BY e.salary DESC;

/* 18 */
SELECT  e.first_name, e.last_name,e.salary,D.department_name,L.city,D.department_id,L.postal_code
FROM hr.EMPLOYEES e, hr.COUNTRIES C,hr.LOCATIONS L, hr.DEPARTMENTS D
WHERE C.country_id=L.country_id
AND L.location_id=D.location_id
AND E.department_id=D.department_id
AND (d.department_id =80 OR d.department_id =50 OR d.department_id =100)
AND (e.salary >4000 AND e.salary < 8000)
AND L.city='South San Francisco';


/* 19 */

SELECT e.employee_id as Codigo, (e.first_name||', '||e.last_name) as Nombres, (INITCAP(e.email)||'@eisi.ues.edu.sv') as email, (('('||SUBSTR(e.phone_number, 1,3)||')-'||SUBSTR(e.phone_number, 5,3)||'-'||SUBSTR(e.phone_number, 9,4))) as PHONE_NUMBER
FROM hr.EMPLOYEES e
WHERE LENGTH(e.phone_number) <= 12
UNION
SELECT e.employee_id as Codigo, (e.first_name||', '||e.last_name) as Nombres, (INITCAP(e.email)||'@eisi.ues.edu.sv') as email, (('('||SUBSTR(e.phone_number, 1,3)||'-'||SUBSTR(e.phone_number, 5,2)||' -'||SUBSTR(e.phone_number, 8,4)||'-'||SUBSTR(e.phone_number, 13)||'-')) as PHONE_NUMBER
FROM hr.EMPLOYEES e
WHERE LENGTH(e.phone_number) > 12;

/* 20 */

SELECT l.city, c.country_id,
CASE c.country_name
    WHEN 'United Kingdom' THEN 'UNKing'
    ELSE 'Non- UNKing'
END Pais
FROM hr.LOCATIONS l, hr.COUNTRIES c
WHERE c.country_id = l.country_id
AND l.city LIKE 'S%';


/* 21 */

SELECT d.department_id AS Codigo_departamento, COUNT(e.employee_id) as Empleados_departamentos
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d
WHERE d.department_id = e.department_id
GROUP BY d.department_id
ORDER BY d.department_id;

/* 22 */

SELECT first_name
FROM hr.EMPLOYEES
GROUP BY first_name
HAVING COUNT(*) >= 2;

/* 23 */

SELECT first_name
FROM hr.EMPLOYEES
GROUP BY first_name
HAVING COUNT(*) < 2;

/* 24 */

SELECT r.region_name, r.region_id, COUNT(*)
FROM hr.COUNTRIES c, hr.REGIONS r
WHERE c.region_id = r.region_id
GROUP BY r.region_name, r.region_id;

/* 25 */

SELECT j.job_title, j.job_id, COUNT(*)
FROM hr.EMPLOYEES e, hr.JOBS j
WHERE e.job_id = j.job_id
GROUP BY j.job_title, j.job_id
ORDER BY 3 DESC;

/* 26 */

SELECT d.department_name, COUNT(*) Numero_de_empleados
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d
WHERE e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY 1;

/* 27 */

SELECT r.region_name, COUNT(*)
FROM hr.COUNTRIES c, hr.REGIONS r, hr.LOCATIONS l, hr.DEPARTMENTS d
WHERE c.region_id = r.region_id
AND c.country_id = l.country_id
AND l.location_id = d.location_id
GROUP BY r.region_name;

/* 28 */

SELECT e.department_id, d.department_name, SUM(e.salary)
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d
WHERE d.department_id = e.department_id
GROUP BY e.department_id, d.department_name
ORDER BY 3 DESC;

/* 29 */

SELECT EXTRACT(YEAR  FROM TO_DATE(hire_date, 'DD-MON-RR')) AÑO, MIN(salary), MAX(salary), AVG(salary)
FROM hr.EMPLOYEES
GROUP BY EXTRACT(YEAR  FROM TO_DATE(hire_date, 'DD-MON-RR'))
ORDER BY 1 DESC;

/* 30 */

SELECT e.department_id codigo_del_departamento, e.job_id Puesto_de_trabajo, COUNT(*) empleados
FROM hr.EMPLOYEES e, hr.JOBS j
WHERE e.job_id = j.job_id
AND (e.department_id = 50 OR e.department_id = 80)
GROUP BY e.department_id, e.job_id
ORDER BY e.department_id, e.job_id;

/* 31 */

SELECT e.department_id codigo_del_departamento, e.job_id Puesto_de_trabajo, COUNT(*)
FROM hr.EMPLOYEES e, hr.JOBS j
WHERE e.job_id = j.job_id
GROUP BY e.department_id, e.job_id
HAVING COUNT(*) = 1;

/* 32 */

SELECT l.city, COUNT(*)
FROM hr.EMPLOYEES e, hr.DEPARTMENTS d, hr.LOCATIONS l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.salary > 5000
GROUP BY l.city
HAVING COUNT(*) >= 3;

/* 33 */

SELECT e.department_id codigo_del_departamento, COUNT(*)
FROM hr.EMPLOYEES e
GROUP BY e.department_id
HAVING COUNT(*) > 10;

/* 34 */

SELECT last_name, first_name, salary
FROM hr.EMPLOYEES
WHERE salary = (SELECT MAX(salary) FROM hr.EMPLOYEES);

/* 35 */

SELECT department_id, first_name, last_name
FROM hr.EMPLOYEES
WHERE department_id IN (SELECT department_id
FROM hr.EMPLOYEES
WHERE first_name LIKE '%John%');

/* 36 */

SELECT department_id, first_name, last_name, salary
FROM hr.employees e
WHERE salary = (select MAX (salary) from hr.employees s where e.department_id = s.department_id);





select * from hr.COUNTRIES;