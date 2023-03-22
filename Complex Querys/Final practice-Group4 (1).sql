/* Abdel Enoc Silva Escobar */
/* Erika Alejandra Mendoza Pulido */

/* 1 */

SELECT employee_id, first_name, last_name, email, phone_number,  hire_date, job_id, salary
FROM hr.employees
WHERE JOB_ID = 'ST_CLERK'
AND EXTRACT(YEAR  FROM TO_DATE(hire_date, 'DD-MON-RR')) > 1997;

/* 2 */

select last_name, job_id, salary, ('0'||commission_pct) "COMMISSION_PCT"
from hr.employees
where commission_pct>0
order by salary desc

/* 3 */

SELECT ('The Salary of '||last_name||' after a 10% raise is '||ROUND(1.1*salary)) "New salary"
FROM hr.employees
WHERE commission_pct IS NULL;

/* 4 */

SELECT last_name, TRUNC((MONTHS_BETWEEN (SYSDATE,HIRE_DATE))/12) "YEARS", TRUNC(((TRUNC((MONTHS_BETWEEN (SYSDATE,HIRE_DATE))/12,1))-(TRUNC((MONTHS_BETWEEN (SYSDATE,HIRE_DATE)/12),0)))*12) "MONTH"
    FROM hr.employees
ORDER BY 2


/* 5 */

SELECT LAST_NAME
FROM hr.employees
WHERE LAST_NAME LIKE 'J%'
OR LAST_NAME LIKE 'K%'
OR LAST_NAME LIKE 'L%'
OR LAST_NAME LIKE 'M%'

/* 6 */
SELECT LAST_NAME, SALARY,
CASE 
WHEN (COMMISSION_PCT*10)>0 THEN 'YES'
ELSE 'NO'
end COMMISSION
FROM hr.employees;




/* 7 */

SELECT d.DEPARTMENT_NAME, l.LOCATION_ID, e.LAST_NAME, e.JOB_ID, e.SALARY
FROM hr.employees e, hr.DEPARTMENTS d, hr.LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.location_id = l.location_id
AND l.LOCATION_ID = 1800;


/* 8 */
SELECT COUNT(*)
    FROM hr.employees
WHERE LAST_NAME LIKE '%n'

SELECT count(*)
from hr.employees
where (SUBSTR(last_name, length(last_name),1 ))='n'


/* 9 */

SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, l.LOCATION_ID, COUNT(E.EMPLOYEE_ID)
FROM hr.employees e, hr.DEPARTMENTS d, hr.LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.location_id = l.location_id
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME, l.LOCATION_ID;

/* 10 */
SELECT job_id
    FROM hr.employees
    where department_id in (10,20)


/* 11 */

SELECT JOB_ID, COUNT(*) "FREQUENCY"
FROM hr.EMPLOYEES
WHERE JOB_ID = 'AD_VP'
OR JOB_ID = 'AD_PRES'
OR JOB_ID = 'AD_ASST'
GROUP BY JOB_ID
ORDER BY 2 DESC;

/* 12 */
SELECT LAST_NAME, HIRE_DATE
    FROM hr.employees
    where 
    EXTRACT(DAY FROM TO_DATE(hire_date, 'DD-MON-RR')) <16;



/* 13 */
SELECT LAST_NAME, SALARY, TRUNC(SALARY/1000) "THOUSANDS"
FROM hr.EMPLOYEES


/* 14 */
create view manager as select
    last_name, salary, grade, employee_id
    from hr.employees e, job_grades jg 
    where salary between lowest_sal and highest_sal
        
select e.last_name,m.last_name, m.salary, m.grade 
from hr.employees e, manager m
where e.manager_id = m.employee_id 
 and m.salary> 15000
order by m.salary desc



/* 15 */

CREATE VIEW CONTEO
AS
SELECT e.department_id, d.DEPARTMENT_NAME, COUNT(d.DEPARTMENT_NAME)"EMPLOYEES", TRUNC(AVG(e.salary)) "AVG_SAL"
FROM hr.employees e, hr.DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID
GROUP BY e.department_id, d.DEPARTMENT_NAME;
    
SELECT c.department_id, c.DEPARTMENT_NAME, c.EMPLOYEES, c.AVG_SAL, em.LAST_NAME, em.SALARY, em.JOB_ID
FROM hr.employees em, CONTEO c
WHERE c.department_id = em.department_id
ORDER BY 1;

/* 16 */

SELECT department_id, MIN(salary)
FROM hr.employees
WHERE department_id = (
   SELECT department_id 
   FROM hr.employees 
   GROUP BY department_id 
   HAVING AVG(salary) = (
       SELECT MAX(PROM) 
       FROM (
           SELECT department_id, AVG(salary) AS PROM 
           FROM hr.employees 
           GROUP BY department_id)))
GROUP BY department_id;




/* 17 */

SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.MANAGER_ID, l.LOCATION_ID
FROM hr.employees e, hr.DEPARTMENTS d, hr.LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.location_id = l.location_id
AND e.DEPARTMENT_ID NOT IN (SELECT DISTINCT em.DEPARTMENT_ID
FROM hr.employees em
WHERE em.JOB_ID = 'SA_REP'
AND em.DEPARTMENT_ID IS NOT NULL)
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.MANAGER_ID, l.LOCATION_ID;

/* 18 */

create view empl_departments as
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS num_employees
FROM hr.departments d
JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
'a'
select department_id, department_name, num_employees
from empl_departments
where num_employees < 3
'b'
select department_id, department_name, num_employees 
from empl_departments
    where num_employees= (select max(num_employees)
    from empl_departments )
'c'
select department_id, department_name, num_employees 
from empl_departments
    where num_employees= (select min(num_employees)
    from empl_departments )




/* 19 */

CREATE VIEW PROMEDIO
AS
SELECT AVG(S.SALARY) "NUM"
FROM hr.employees S
GROUP BY S.DEPARTMENT_ID

SELECT e.employee_id, e.last_name, e.DEPARTMENT_ID, e.salary, p.NUM"AVG(S.SALARY)"
FROM hr.employees e, PROMEDIO p


/* PARTE 2 */

/* 1 */

/* A */
CREATE TABLE AUTHOR (
Author_ID 	varCHAR(10),
Author_Name	varCHAR(20)
);
ALTER TABLE author
ADD CONSTRAINT author_pk PRIMARY KEY (Author_ID);

/* B */
CREATE TABLE BOOKS (
    Book_ID     VARCHAR(10),
    Book_Name   VARCHAR(50),
    Author_ID 	varCHAR(10),
    Price       NUMBER(10,2),
    Publisher_ID    VARCHAR(10)
);
ALTER TABLE BOOKS
ADD CONSTRAINT BOOKS_pk PRIMARY KEY (Book_ID);


/* C */

CREATE TABLE CUSTOMER (
    Customer_ID    VARCHAR(6),
    Customer_Name  VARCHAR(40),
    Street_Address VARCHAR(50),
    City		   VARCHAR(25),
    Phone_Number   VARCHAR(15),
    Credit_Card_Number VARCHAR(20)    
);
ALTER TABLE CUSTOMER
ADD CONSTRAINT CUSTOMER_pk PRIMARY KEY (Customer_ID);



/* D */
CREATE TABLE CREDIT_CARD_DETAILS (
Credit_Card_Number 	varCHAR(20),
Credit_Card_Type	varCHAR(10),
Expiry_Date			DATE
);
ALTER TABLE CREDIT_CARD_DETAILS
ADD CONSTRAINT CREDIT_CARD_DETAILS_pk PRIMARY KEY (Credit_Card_Number);


/* E */
CREATE TABLE ORDER_DETAILS (
    Order_ID         VARCHAR(6),
    Customer_ID      VARCHAR(6),
    Shipping_Type    VARCHAR(10),
    Date_of_Purchase    DATE,
    Shopping_Cart_ID    VARCHAR(10)
);

ALTER TABLE ORDER_DETAILS
ADD CONSTRAINT ORDER_DETAILS_pk PRIMARY KEY (Order_ID);


/* F */

CREATE TABLE PUBLISHER (
    Publisher_ID    VARCHAR(10),
    Publisher_Name  VARCHAR(50)
);
ALTER TABLE PUBLISHER
ADD CONSTRAINT Publisher_pk PRIMARY KEY (Publisher_ID);


/* G */
CREATE TABLE PURCHASE_HISTORY (
    Customer_ID VARCHAR(6),
    Order_ID    VARCHAR(6)
);


/* H */

CREATE TABLE SHIPPING_TYPE (
    Shipping_Type    VARCHAR(10),
    Shipping_Price  Number(6)
);
ALTER TABLE SHIPPING_TYPE
ADD CONSTRAINT SHIPPING_TYPE_pk PRIMARY KEY (Shipping_Type);

/* I */

CREATE TABLE SHOPPING_CART (
    Shopping_Cart_ID    VARCHAR(10),
    Book_ID  			VARCHAR(10),
    Price 				NUMBER(10),
    Date_		 		DATE,
   Quantity   			NUMBER(6)
);
ALTER TABLE SHOPPING_CART
ADD CONSTRAINT SHOPPING_CART_pk PRIMARY KEY (Shopping_Cart_ID);

alter table SHOPPING_CART add constraint FK_SHOPPING_CART foreign key (Book_ID)
      references BOOKS (Book_ID);
alter table PURCHASE_HISTORY add constraint FK_PURCHASE_HISTORY foreign key (Customer_ID)
      references CUSTOMER(Customer_ID);
alter table PURCHASE_HISTORY add constraint FK_PURCHASE_HISTORY_T foreign key (Order_ID)
      references ORDER_DETAILS(Order_ID);
alter table CUSTOMER add constraint FK_CUSTOMER foreign key (Credit_Card_Number)
      references Credit_Card_Details (Credit_Card_Number);

alter table BOOKS add constraint FK_BOOKS foreign key (Author_ID)
      references AUTHOR (Author_ID);

alter table BOOKS add constraint FK_BOOK_S foreign key (Publisher_ID)
      references PUBLISHER (Publisher_ID);


alter table ORDER_DETAILS add constraint FK_ORDER_DETAILS foreign key (Customer_ID)
      references CUSTOMER (Customer_ID);

alter table ORDER_DETAILS add constraint FK_ORDER_DETAIL_S foreign key (Shipping_Type)
      references SHIPPING_TYPE (Shipping_Type);

alter table ORDER_DETAILS add constraint FK_ORDER_DETAI_LS foreign key (Shopping_Cart_ID)
      references SHOPPING_CART (Shopping_Cart_ID);

/* 4 */
/* A */
CREATE SEQUENCE ORDER_ID_SEQ
START WITH 100
    nocache;

SELECT *
FROM USER_SEQUENCES;

/* 5 */
INSERT INTO AUTHOR VALUES ('AN0001', 'Oliver Goldsmith');
INSERT INTO AUTHOR VALUES ('AN0002', 'Oscar Wilde');
INSERT INTO AUTHOR VALUES ('AN0003', 'George Bernard Shaw');
INSERT INTO AUTHOR VALUES ('AN0004', 'Leo Tolstoy');
INSERT INTO AUTHOR VALUES ('AN0005', 'Percy Shelley');
INSERT INTO AUTHOR VALUES ('AN0006', 'Lord Byron');
INSERT INTO AUTHOR VALUES ('AN0007', 'John Keats');
INSERT INTO AUTHOR VALUES ('AN0008', 'Rudyard Kipling');
INSERT INTO AUTHOR VALUES ('AN0009', 'P. G. Wodehouse');

SELECT * FROM AUTHOR;
COMMIT;

INSERT INTO PUBLISHER VALUES ('PN0001', 'Elsevier');
INSERT INTO PUBLISHER VALUES ('PN0002', 'Penguin Group');
INSERT INTO PUBLISHER VALUES ('PN0003', 'Pearson Education');
INSERT INTO PUBLISHER VALUES ('PN0004', 'Cambridge University Press');
INSERT INTO PUBLISHER VALUES ('PN0005', 'Dorling Kindersley');

SELECT * FROM PUBLISHER;
COMMIT;


INSERT INTO SHIPPING_TYPE VALUES ('USPS', 150);
INSERT INTO SHIPPING_TYPE VALUES ('FedEx', 200);
INSERT INTO SHIPPING_TYPE VALUES ('DHL', 150);

SELECT * FROM SHIPPING_TYPE;
COMMIT;

INSERT INTO CUSTOMER VALUES ('CN0001', 'VelasquesCarmen', '283 King Street', 'Seatle', '587-99-6666','000-111-222-333');
INSERT INTO CUSTOMER VALUES ('CN0002', 'Ngao LaDoris', '5 Modrany', 'Bratislava', '586-355-8882','000-111-222-444');
INSERT INTO CUSTOMER VALUES ('CN0003', 'Nagayama Midori', '68 Via Centrale', 'Sao Paolo', '254-852-5764','000-111-222-555');
INSERT INTO CUSTOMER VALUES ('CN0004', 'Quick-To-See Mark', '6921 King Way', 'Lagos', '63-559-777','000-111-222-666');
INSERT INTO CUSTOMER VALUES ('CN0005', 'Ropeburn Audry', '86 Chu Street', 'Hong Kong', '41-559-87','000-111-222-777');
INSERT INTO CUSTOMER VALUES ('CN0006', 'Urguhart Molly', '3035 Laurier Blvd.', 'Quebec', '418-542-9988','000-111-222-888');
INSERT INTO CUSTOMER VALUES ('CN0007', 'Menchu Roberta', 'Boulevard de Waterloo 41', 'Brussels', '322-504-2228','000-111-222-999');
INSERT INTO CUSTOMER VALUES ('CN0008', 'Biri Ben', '398 High St.', 'Columbus', '614-455-9863','000-111-222-222');
INSERT INTO CUSTOMER VALUES ('CN0009', 'Catchpole Antoinette', '88 Alfred St.', 'Brisbane', '616-399-1411','000-111-222-111');

SELECT * FROM CUSTOMER;

COMMIT;

INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-333', 'VISA', '17-JUN-09');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-444', 'MasterCard', '24-SEP-05');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-555', 'AMEX', '11-JUL-06');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-666', 'VISA', '22-OCT-08');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-777', 'AMEX', '26-AUG-00');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-888', 'MasterCard', '15-MAR-08');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-999', 'VISA', '04-AUG-09');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-111', 'Maestro', '27-SEP-01');
INSERT INTO CREDIT_CARD_DETAILS VALUES ('000-111-222-222', 'AMEX', '09-AUG-04');

SELECT * FROM CREDIT_CARD_DETAILS;

COMMIT;

INSERT INTO BOOKS VALUES ('BN0001', 'Florentine Tragedy', 								'AN0002', 150, 'PN0002');
INSERT INTO BOOKS VALUES ('BN0002', 'A Vision',				 							'AN0002', 100, 'PN0003');
INSERT INTO BOOKS VALUES ('BN0003', 'Citizen of the World', 							'AN0001', 100, 'PN0001');
INSERT INTO BOOKS VALUES ('BN0004', 'The Complete Poetical 	Works of Oliver Goldsmith', 'AN0001', 300, 'PN0001');
INSERT INTO BOOKS VALUES ('BN0005', 'Androcles and the Lion', 							'AN0003', 90, 'PN0004');
INSERT INTO BOOKS VALUES ('BN0006', 'An Unsocial Socialist', 							'AN0003', 80, 'PN0004');
INSERT INTO BOOKS VALUES ('BN0007', 'A Thing ok Beauthy is a Joy Forever',				'AN0007', 100, 'PN0002');
INSERT INTO BOOKS VALUES ('BN0008', 'Beyond the Pale', 									'AN0008', 75, 'PN0005');
INSERT INTO BOOKS VALUES ('BN0009', 'The clicking of Cuthbert', 						'AN0009', 175, 'PN0005');
INSERT INTO BOOKS VALUES ('BN0010', 'Bride of Frankenstein', 							'AN0006', 200, 'PN0001');
INSERT INTO BOOKS VALUES ('BN0011', 'Shelley Poetry and Prose',							'AN0005', 150, 'PN0003');
INSERT INTO BOOKS VALUES ('BN0012', 'War and Peace',									'AN0004', 150, 'PN0002');

SELECT * FROM BOOKS;
COMMIT;


INSERT INTO SHOPPING_CART VALUES ('SC0001', 'BN0002', 200, '12-JUN-01', 10);
INSERT INTO SHOPPING_CART VALUES ('SC0002', 'BN0003', 90, '31-JUL-05', 8);
INSERT INTO SHOPPING_CART VALUES ('SC0003', 'BN0003', 175, '28-JUN-05', 7);
INSERT INTO SHOPPING_CART VALUES ('SC0004', 'BN0001', 80, '14-AUG-06', 9);
INSERT INTO SHOPPING_CART VALUES ('SC0005', 'BN0001', 175, '21-SEP-06', 4);
INSERT INTO SHOPPING_CART VALUES ('SC0006', 'BN0004', 100, '11-AUG-07', 6);
INSERT INTO SHOPPING_CART VALUES ('SC0007', 'BN0005', 200, '28-OCT-07', 5);
INSERT INTO SHOPPING_CART VALUES ('SC0008', 'BN0006', 100, '25-NOV-09', 7);
INSERT INTO SHOPPING_CART VALUES ('SC0009', 'BN0006', 150, '18-SEP-09', 8);

SELECT * FROM SHOPPING_CART;
COMMIT;

INSERT INTO ORDER_DETAILS VALUES ('0D0001', 'CN0001', 'USPS', '12-JUN-01', 'SC0002');
INSERT INTO ORDER_DETAILS VALUES ('0D0002', 'CN0002', 'USPS', '28-JUN-05', 'SC0005');
INSERT INTO ORDER_DETAILS VALUES ('0D0003', 'CN0003', 'FedEx', '31-JUL-05', 'SC0007');
INSERT INTO ORDER_DETAILS VALUES ('0D0004', 'CN0004', 'FedEx', '14-AUG-06', 'SC0004');
INSERT INTO ORDER_DETAILS VALUES ('0D0005', 'CN0005', 'FedEx', '21-SEP-06', 'SC0003');
INSERT INTO ORDER_DETAILS VALUES ('0D0006', 'CN0006', 'DHL', '28-OCT-07', 'SC0001');
INSERT INTO ORDER_DETAILS VALUES ('0D0007', 'CN0007', 'DHL', '11-AUG-07', 'SC0006');
INSERT INTO ORDER_DETAILS VALUES ('0D0008', 'CN0008', 'DHL', '18-SEP-09', 'SC0008');
INSERT INTO ORDER_DETAILS VALUES ('0D0009', 'CN0009', 'USPS', '25-NOV-09', 'SC0009');

SELECT * FROM ORDER_DETAILS;

COMMIT;



INSERT INTO PURCHASE_HISTORY VALUES ('CN0001', '0D0001');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0003', '0D0002');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0002', '0D0002');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0005', '0D0005');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0006', '0D0006');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0007', '0D0007');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0008', '0D0008');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0009', '0D0009');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0004', '0D0005');
INSERT INTO PURCHASE_HISTORY VALUES ('CN0009', '0D0007');

SELECT * FROM PURCHASE_HISTORY;
COMMIT;


/* 6 */

SELECT C.Customer_Name, C.Street_Address, P.Order_ID, C.Customer_ID, O.SHIPPING_TYPE, O.Date_of_Purchase, O.Shopping_Cart_ID
FROM CUSTOMER C, PURCHASE_HISTORY P, ORDER_DETAILS O, SHOPPING_CART S
WHERE C.Customer_ID = P.Customer_ID
AND C.Customer_ID = O.Customer_ID
AND O.Shopping_Cart_ID = S.Shopping_Cart_ID
ORDER BY 4;


/* 7 */
/* A */
INSERT INTO BOOKS VALUES ('BN0013', 'Two states','AN0009', 150, 'PN0005');
COMMIT;


/* B */
INSERT INTO SHOPPING_CART VALUES ('SC0010', 'BN0013', 200, '12-JUN-06', 12);
COMMIT;


/* 8 */
SELECT C.Customer_Name, C.Customer_ID, O.Shopping_Cart_ID, S.Book_ID, O.Date_of_Purchase
FROM CUSTOMER C, ORDER_DETAILS O, SHOPPING_CART S
WHERE C.Customer_ID = O.Customer_ID
AND O.Shopping_Cart_ID = S.Shopping_Cart_ID