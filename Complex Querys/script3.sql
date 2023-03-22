/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */
SELECT TO_CHAR
(SYSDATE, 'DD-MON-YYYY') "NOW"
 FROM DUAL;

 /* 2-3 */
 select employee_id, last_name, salary, salary+((salary*15.5)/100) as NewSalary
from hr.employees;

/* 4 */
select employee_id, last_name, salary, 
    salary+((salary*15.5)/100) as NewSalary,
    salary+((salary*15.5)/100)-salary as Increase
	from hr.employees;
 
/* 5 */
/* A */
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM hr.EMPLOYEES
WHERE last_name like 'J%'
OR last_name like 'A%'
OR last_name like 'M%'
ORDER BY 1;

/* B */
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM hr.EMPLOYEES
WHERE last_name like '&START_LETTER%';

/* C */
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM hr.EMPLOYEES
WHERE last_name like UPPER('&START_LETTER%');

/* 6 */
select last_name, round (Months_between (sysdate, hire_date)) as months
    from hr.employees
    order by 2 asc;

/* 7 */
SELECT last_name, LPAD(salary, 15, '$') "SALARY"
FROM hr.EMPLOYEES

/* 8 */
select rpad(last_name, 8) ||'	'|| rpad(' ',salary/1000+1,'*') as EMPLOYEES_AND_THER_SALARIES
    from hr.employees
    order by salary desc;

/* 9 */
SELECT last_name, TRUNC(((current_date - hire_date)/7), 0) TENURE
FROM hr.EMPLOYEES
 
 