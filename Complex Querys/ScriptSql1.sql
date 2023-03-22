/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */

/* Task 1 */
/* 1 */
TRUE

/* 2 */
FALSE

/* 3 */
Falta una ',' al final de la primera linea
Falta mas ',' en la segunda linea para correr
las columnas (sal, ANNUAL,12) no existe
X no es un operador matematico

/* Task 2 */
/*1*/
describe hr.departments;
select * from hr.departments;

/*2*/
a
describe hr.employees;

b
select employee_id, last_name, job_id, hire_date as STARTDATE
from hr.employees;

/*3*/
select unique job_id
from hr.employees;


/* Task 3 */
/* 1 */
SELECT employee_id Emp#, last_name Employee, job_id Job, hire_date "Hire Date"
FROM hr.EMPLOYEES;

/* 2 */
SELECT (last_name||', '||job_id) "Employee and Title"
FROM hr.EMPLOYEES;

/* 3 */
SELECT (employee_id||','||first_name||','||last_name||','||email||','||phone_number||','||hire_date||','||job_id||','||salary||','||commission_pct||','||manager_id||','||department_id) THE_OUTPUT
FROM hr.EMPLOYEES;
