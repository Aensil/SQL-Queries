/* Abdel Enoc Silva Escobar */
/* Brayan Jair Briceño Delgado */


/* 1 */
SELECT (last_name||' earns $'||TO_CHAR(salary,'FM999,999,999')||'.00'||' monthly but wants $'||TO_CHAR(salary*3,'FM999,999,999')||'.00') "Dream Salaries"
FROM hr.EMPLOYEES;

/* 2 */
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6),'Monday'), 'fmDay, "the" Ddspth, "of" Month, YYYY' ) as Review
from hr.employees;


/* 3 */

SELECT last_name, NVL(TO_CHAR(commission_pct), 'No commission') "COMM"
FROM hr.EMPLOYEES;

/* 4 */

SELECT job_id, 
DECODE (job_id, 'AD_PRES', 'A',
    'SA_MAN', 'B',
    'IT_PROG', 'C',
    'SA_REP', 'D',
    'ST_CLERK', 'E',
    '0') "GRADE"
FROM hr.EMPLOYEES;

/* 5 */

SELECT job_id, 
CASE job_id
	WHEN 'AD_PRES'
    THEN 'A'
    WHEN 'SA_MAN'
    THEN 'B'
    WHEN 'IT_PROG'
    THEN 'C'
    WHEN 'SA_REP'
    THEN 'D'
    WHEN 'ST_CLERK'
    THEN 'E'
    ELSE '0'
END GRADE
FROM hr.EMPLOYEES;