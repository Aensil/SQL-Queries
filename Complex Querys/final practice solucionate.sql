1.	The HR department needs to find data for all the clerks who were hired after 1997.
SELECT *
FROM	hr.employees
WHERE job_id = 'ST_CLERK' 
AND hire_date > '31-DEC-1997';

2.	The HR department needs a report of employees who earn a commission. Show the last name, job, salary, and commission of these employees. Sort the data by salary in descending order.
SELECT last_name, job_id, salary, commission_pct 
FROM	hr.employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

3.	For budgeting purposes, the HR department needs a report on projected raises. The report should display those employees who do not get a commission but who have a 10% raise in salary (round off the salaries).
SELECT 'The salary of '||last_name||' after a 10% raise is ' || ROUND(salary*1.10) "New salary" 
FROM	hr.employees
WHERE commission_pct IS NULL;

4.	Create a report of employees and the duration of their employment. Show the last names of all employees, together with the number of years and the number of completed months that they have been employed. Order the report by the duration of their employment. The employee who has been employed the longest should appear at the top of the list.
SELECT last_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) YEARS, TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, hire_date), 12)) MONTHS
FROM hr.employees
ORDER BY years DESC, MONTHS desc;

5.	Show those employees who have a last name that starts with the letters “J,” “K,” “L,” or “M.”
SELECT last_name 
FROM	hr.employees
WHERE SUBSTR(last_name, 1,1) IN ('J', 'K', 'L', 'M');

6.	Create a report that displays all employees, and indicate with the words Yes or No whether they receive a commission. Use the DECODE expression in your query.
These exercises can be used for extra practice after you have discussed the following topics: basic SQL SELECT statement, basic SQL Developer commands, SQL functions, joins, and group functions.
SELECT last_name, salary, decode(commission_pct, NULL, 'No', 'Yes') commission 
FROM	hr.employees;

7.	Create a report that displays the department name, location ID, last name, job title, and salary of those employees who work in a specific location. Prompt the user for a location.
Enter 1800 for location_id when prompted.
SELECT d.department_name, d.location_id, e.last_name, e.job_id, e.salary
FROM	hr.employees e 
JOIN hr.departments d
ON	e.department_id = d.department_id 
AND		d.location_id = &location_id;

8.	Find the number of employees who have a last name that ends with the letter “n.” Create two possible solutions.
SELECT COUNT(*)
FROM	hr.employees
WHERE last_name LIKE '%n';
--or
SELECT COUNT(*)
FROM	hr.employees
WHERE SUBSTR(last_name, -1) = 'n';

9.	Create a report that shows the name, location, and number of employees for each department. Make sure that the report also includes department_IDs without employees.
SELECT d.department_id, d.department_name, d.location_id,COUNT(e.employee_id)
FROM hr.employees e 
RiGHT OUTER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name, d.location_id

10.	The HR department needs to find the job titles in departments 10 and 20. Create a report to display the job IDs for these departments.
SELECT DISTINCT job_id 
FROM	hr.employees
WHERE department_id IN (10, 20);

11.	Create a report that displays the jobs that are found in the Administration and Executive departments. Also display the number of employees for these jobs. Show the job with the highest number of employees first.
SELECT e.job_id, count(e.job_id) FREQUENCY 
FROM	hr.employees e 
JOIN hr.departments d
ON e.department_id = d.department_id
WHERE	d.department_name IN ('Administration', 'Executive') 
GROUP BY e.job_id
ORDER BY FREQUENCY DESC;
These exercises can be used for extra practice after you have discussed the following topics: basic SQL SELECT statements, basic SQL Developer commands, SQL functions, joins, group functions, and subqueries.

12.	Show all employees who were hired in the first half of the month (before the 16th of the month, irrespective of the year).
SELECT last_name, hire_date 
FROM	hr.employees
WHERE TO_CHAR(hire_date, 'DD') < 16;

13.	Create a report that displays the following for all employees: last name, salary, and salary expressed in terms of thousands of dollars.
SELECT last_name, salary, TRUNC(salary, -3)/1000 Thousands
FROM	hr.employees;

14.	Show all employees who have managers with a salary higher than $15,000. Show the following data: employee name, manager name, manager salary, and salary grade of the manager.
SELECT e.last_name, m.last_name manager, m.salary, j.grade_level
FROM hr.employees e 
JOIN hr.employees m 
ON e.manager_id = m.employee_id 
JOIN job_grades j
ON    m.salary BETWEEN j.lowest_sal AND j.highest_sal
AND   m.salary > 15000;
 
15.	Show the department number, name, number of employees, and average salary of all departments, together with the names, salaries, and jobs of the employees working in each department.
SELECT d.department_id, d.department_name, count(e1.employee_id) employees, NVL(TO_CHAR(AVG(e1.salary), '99999.99'), 'No average' ) avg_sal, e2.last_name, e2.salary, e2.job_id
FROM	hr.departments d 
RIGHT OUTER JOIN hr.employees e1 
ON	d.department_id = e1.department_id
RIGHT OUTER JOIN hr.employees e2
ON	d.department_id = e2.department_id
GROUP BY d.department_id, d.department_name, e2.last_name, e2.salary, e2.job_id
ORDER BY d.department_id, employees;

16.	Create a report to display the department number and lowest salary of the department with the highest average salary.
SELECT department_id, MIN(salary) 
FROM	hr.employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MAX(AVG(salary))
						FROM	hr.employees
						GROUP BY department_id);

17.	Create a report that displays the departments where no sales representatives work. Include the department number, department name, manager ID, and location in the output.
SELECT *
FROM	hr.departments
WHERE department_id NOT IN(SELECT department_id
							FROM hr.employees
							WHERE job_id = 'SA_REP'
							AND department_id IS NOT NULL);

18.	Create the following statistical reports for the HR department. Include the department number, department name, and the number of employees working in each department that:
a.	Employs fewer than three employees:
SELECT d.department_id, d.department_name, COUNT(*) 
FROM	hr.departments d 
JOIN hr.employees e
ON	d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) < 3;

b.	Has the highest number of employees:
SELECT d.department_id, d.department_name, COUNT(*) 
FROM	departments d JOIN hr.employees e
ON	d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name HAVING COUNT(*) = (SELECT MAX(COUNT(*))
																	FROM	hr.employees
																	GROUP BY department_id);

c.	Has the lowest number of employees:
SELECT d.department_id, d.department_name, COUNT(*) 
FROM	departments d 
JOIN employees e
ON	d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name HAVING COUNT(*) = (SELECT MIN(COUNT(*))
																	FROM	hr.employees
																	GROUP BY department_id);

19.	Create a report that displays the employee number, last name, salary, department number, and the average salary in their department 
SELECT e.employee_id, e.last_name, e.department_id, e.salary, AVG(s.salary)
FROM	hr.employees e 
JOIN hr.employees s
ON	e.department_id = s.department_id
GROUP BY e.employee_id, e.last_name, e.department_id, e.salary;

Part 2
1.	Table Details
a.	AUTHOR
	CREATE TABLE AUTHOR (
	Author_ID VARCHAR2 (10) NOT NULL ,
	Author_Name VARCHAR2 (20)
	)
	;
	COMMENT ON TABLE AUTHOR IS 'Author'
	;
	ALTER TABLE AUTHOR
	ADD CONSTRAINT AUTHOR_PK PRIMARY KEY (Author_ID);
b.	BOOKS
	CREATE TABLE BOOKS (
	Book_ID VARCHAR2 (10) NOT NULL ,
	Book_Name VARCHAR2 (50) ,
	Author_ID VARCHAR2 (10) NOT NULL , Price NUMBER (10) ,
	Publisher_ID VARCHAR2 (10) NOT NULL
	)
	;
	COMMENT ON TABLE BOOKS IS 'Books'
	;
	ALTER TABLE BOOKS
	ADD CONSTRAINT books_PK PRIMARY KEY ( Book_ID );
c.	CUSTOMER
	CREATE TABLE CUSTOMER (
	Customer_ID VARCHAR2 (6) NOT NULL ,
	Customer_Name VARCHAR2 (40) , Street_Address VARCHAR2 (50) , City VARCHAR2 (25) ,
	Phone_Number VARCHAR2 (15) , Credit_Card_Number VARCHAR2 (20) NOT NULL
	)
	;
	COMMENT ON TABLE CUSTOMER IS 'Customer'
	;
	ALTER TABLE CUSTOMER
	ADD CONSTRAINT Customer_PK PRIMARY KEY ( Customer_ID ) ;

d.	CREDIT_CARD_DETAILS
	CREATE TABLE CREDIT_CARD_DETAILS (
	Credit_Card_Number VARCHAR2 (20) NOT NULL , Credit_Card_Type VARCHAR2 (10) , Expiry_Date DATE
	)
	;
	COMMENT ON TABLE CREDIT_CARD_DETAILS IS 'Credit Card Details'
	;
	ALTER TABLE CREDIT_CARD_DETAILS
	ADD CONSTRAINT Credit_Card_Details_PK PRIMARY KEY ( Credit_Card_Number) ;
 
e.	ORDER_DETAILS
	CREATE TABLE ORDER_DETAILS (
	Order_ID VARCHAR2 (6) NOT NULL , Customer_ID VARCHAR2 (6) NOT NULL ,
	Shipping_Type VARCHAR2 (10) NOT NULL , Date_of_Purchase DATE ,
	Shopping_Cart_ID varchar2(6) NOT NULL
	)
	;
	COMMENT ON TABLE ORDER_DETAILS IS 'Order Details'
	;
	ALTER TABLE ORDER_DETAILS
	ADD CONSTRAINT ORDER_DETAILS_PK PRIMARY KEY (Order_ID ) ;
f.	PUBLISHER
	CREATE TABLE PUBLISHER (
	Publisher_ID VARCHAR2 (10) NOT NULL ,
	Publisher_Name VARCHAR2 (50)
	)
	;
	COMMENT ON TABLE PUBLISHER IS 'Publisher'
	;
	ALTER TABLE PUBLISHER
	ADD CONSTRAINT PUBLISHER_PK PRIMARY KEY ( Publisher_ID) ;
g.	PURCHASE_HISTORY
	CREATE TABLE PURCHASE_HISTORY (	Customer_ID VARCHAR2 (6) NOT NULL , Order_ID VARCHAR2 (6) NOT NULL	);
	COMMENT ON TABLE PURCHASE_HISTORY IS 'Purchase History';
h.	SHIPPING_TYPE
	CREATE TABLE SHIPPING_TYPE (
	Shipping_Type VARCHAR2 (10) NOT NULL , Shipping_Price NUMBER (6)
	)
	;
	COMMENT ON TABLE SHIPPING_TYPE IS 'Shipping Type'
	;
	ALTER TABLE SHIPPING_TYPE
	ADD CONSTRAINT SHIPPING_TYPE_PK PRIMARY KEY ( Shipping_Type
	) ;
i.	SHOPPING _CART
	CREATE TABLE SHOPPING_CART (
	Shopping_Cart_ID VARCHAR2 (6) NOT NULL , Book_ID VARCHAR2 (10) NOT NULL ,
	Price NUMBER (10) ,
	Shopping_cart_Date DATE , Quantity NUMBER (6)
	)
	;
	COMMENT ON TABLE SHOPPING_CART IS 'Shopping Cart'
	;
	ALTER TABLE SHOPPING_CART
	ADD CONSTRAINT SHOPPING_CART_PK PRIMARY KEY (SHOPPING_CART_ID)
	;

 
2.	Adding Additional Referential Integrity Constraints to the Table Created

a.	Include a Foreign Key constraint in the BOOKS table.
	ALTER TABLE BOOKS
	ADD CONSTRAINT BOOKS_AUTHOR_FK FOREIGN KEY (
	Author_ID
	)
	REFERENCES AUTHOR (
	Author_ID
	)
	;
	ALTER TABLE BOOKS
	ADD CONSTRAINT BOOKS_PUBLISHER_FK FOREIGN KEY (
	Publisher_ID
	)
	REFERENCES PUBLISHER (
	Publisher_ID
	);
b.	Include a Foreign Key constraint in the ORDER_DETAILS table.
	 ALTER TABLE ORDER_DETAILS
	ADD CONSTRAINT Order_ID_FK FOREIGN KEY (
	Customer_ID
	)
	REFERENCES CUSTOMER (
	Customer_ID
	)
	;
	ALTER TABLE ORDER_DETAILS
	ADD CONSTRAINT FK_Order_details FOREIGN KEY (Shipping_Type)
	REFERENCES SHIPPING_TYPE (Shipping_Type);
	ALTER TABLE ORDER_DETAILS
	ADD CONSTRAINT Order_Details_fk FOREIGN KEY (Shopping_Cart_ID)
	REFERENCES SHOPPING_CART (Shopping_Cart_ID);							
c.	Include a Foreign Key constraint in the PURCHASE_HISTORY table.
	ALTER TABLE PURCHASE_HISTORY
	ADD CONSTRAINT Pur_Hist_ORDER_DETAILS_FK FOREIGN KEY (Order_ID)
	REFERENCES ORDER_DETAILS (Order_ID);
	ALTER TABLE PURCHASE_ HISTORY
	ADD CONSTRAINT Purchase_History_CUSTOMER_FK FOREIGN KEY (Customer_ID)
	REFERENCES CUSTOMER (Customer_ID) ;
d.	Include a Foreign Key constraint in the SHOPPING_CART table.
	ALTER TABLE SHOPPING_CART
	ADD CONSTRAINT SHOPPING_CART_BOOKS_FK FOREIGN KEY (Book_ID)
	REFERENCES BOOKS (Book_ID);
3.	Verify that the tables were created properly by checking in the Connections Navigator in SQL Developer. In the Connections Navigator, expand Connections > myconnection > Tables.

4.	Create a sequence to uniquely identify each row in the ORDER DETAILS table.
a.	Start with 100; do not allow caching of the values. Name the sequence ORDER_ID_SEQ.
	CREATE SEQUENCE order_id_seq START WITH 100
	NOCACHE;
b.	Verify the existence of the sequences in the Connections Navigator in SQL Developer.
In the Connections Navigator, assuming that the myconnection node is expanded, expand Sequences.
You can alternatively also query the user_sequences data dictionary view:
	SELECT * FROM user_sequences;

5.	Add data to the tables.
a.	
INSERT INTO AUTHOR (Author_ID, Author_Name) VALUES ('AN0001','Oliver Goldsmith');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0002','Oscar Wilde');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0003','George Bernard Shaw');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0004','Leo Tolstoy');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0005','Percy Shelley');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0006','Lord Byron');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0007','John Keats');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0008','Rudyard Kipling');
INSERT INTO AUTHOR (Author_ID, Author_Name)  VALUES ('AN0009', 'P. G. Wodehouse');


b.	PUBLISHER Table

Insert into publisher values ('PN0001', 'Elsevier');
Insert into publisher values ('PN0002', 'Penguin Group');
Insert into publisher values ('PN0003', 'Pearson Education');
Insert into publisher values ('PN0004', 'Cambridge University Press');
Insert into publisher values ('PN0005', 'Dorling Kindersley');


c.	SHIPPING _TYPE

Shipping_Type	Shipping_Price
Insert into SHIPPING_TYPE values ('USPS', '200');
Insert into SHIPPING_TYPE values ('FedEx', '250');
Insert into SHIPPING_TYPE values ('DHL', '150');

d.	CUSTOMER


Customer
_ ID	Customer _Name	Street
_Address	City	Phone
_number	Credit _Card
_Number
Insert into customer values ('CN0001', 'VelasquezCarmen', '283 King Street', 'Seattle', '587-99-6666', '000-111-222-333');
Insert into customer values ('CN0002', 'Ngao LaDoris', '5 Modrany', 'Bratislav a', '586-355-8882', '000-111-222-444');
Insert into customer values ('CN0003', 'Nagayama Midori', '68 Via Centrale', 'Sao Paolo', '254-852-5764', '000-111-222-555');
Insert into customer values ('CN0004', 'Quick-To-See Mark','6921 King Way', 'Lagos', '63-559-777', '000-111-222-666');
Insert into customer values ('CN0005', 'Ropeburn Audry', '86 Chu Street', 'Hong Kong', '41-559-87', '000-111-222-777');
Insert into customer values ('CN0006', 'Urguhart Molly', '3035 Laurier Blvd.', 'Quebec', '418-542-9988', '000-111-222-888');
Insert into customer values ('CN0007', 'Menchu Roberta', '41 Boulevard de Waterloo ', 'Brussels', '322-504-2228', '000-111-222-999');
Insert into customer values ('CN0008', 'Biri Ben', '398 High St.', 'Columbu s', '614-455-9863', '000-111-222-222');
Insert into customer values ('CN0009', 'Catchpole Antoinette', '88 Alfred St.', 'Brisbane', '616-399-1411', '000-111-222-111');

e.	CREDIT_CARD_DETAILS

Credit _Card_ Number	Credit _Card _Type	Expiry _Date
Insert into CREDIT_CARD_DETAILS values ('000-111-222-333','VISA','17-JUN-2009');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-444','MasterCard','24-SEP-2005');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-555','AMEX','11-JUL-2006');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-666','VISA','22-OCT-2008');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-777','AMEX','26-AUG-2000');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-888','MasterCard','15-MAR-2008');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-999','VISA','4-AUG-2009');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-111','Maestro','27-SEP-2001');
Insert into CREDIT_CARD_DETAILS values ('000-111-222-222','AMEX','9-AUG-2004');

 

f.	BOOKS
Book _ID	Book _Name	Author _ID	Price	Publisher _ID
Insert into BOOKS values ('BN0001','Florentine Tragedy','AN0002',150,'PN0002');
Insert into BOOKS values ('BN0002','A Vision','AN0002',100,'PN0003');
Insert into BOOKS values ('BN0003','Citizen of the World','AN0001',100,'PN0001');
Insert into BOOKS values ('BN0004','The Complete Poetical Works of Oliver Goldsmith','AN0001',300,'PN0001');
Insert into BOOKS values ('BN0005','Androcles and the Lion','AN0003',90,'PN0004');
Insert into BOOKS values ('BN0006','An Unsocial Socialist','AN0003',80,'PN0004');
Insert into BOOKS values ('BN0007','A Thing of Beauty is a Joy Forever','AN0007',100,'PN0002');
Insert into BOOKS values ('BN0008','Beyond the Pale','AN0008',75,'PN0005');
Insert into BOOKS values ('BN0009','The Clicking of Cuthbert','AN0009',175,'PN0005');
Insert into BOOKS values ('BN00010','Bride of Frankenstein','AN0006',200,'PN0001');
Insert into BOOKS values ('BN00011','Shelleys Poetry and Prose','AN0005',150,'PN0003');
Insert into BOOKS values ('BN00012','War and Peace','AN0004',150,'PN0002');

 

g.	SHOPPING_CART
Shopping _Cart
_ID	Book _ID	Price	Shopping _Cart
_Date	Quantity
Insert into SHOPPING_CART values ('SC0001','BN0002',200,'12-JUN-2001',10);
Insert into SHOPPING_CART values ('SC0002','BN0003',90,'31-JUL-2004',8);
Insert into SHOPPING_CART values ('SC0003','BN0003',175,'28-JUN-2005',7);
Insert into SHOPPING_CART values ('SC0004','BN0001',80,'14-AUG-2006',9);
Insert into SHOPPING_CART values ('SC0005','BN0001',175,'21-SEP-2006',4);
Insert into SHOPPING_CART values ('SC0006','BN0004',100,'11-AUG-2007',6);
Insert into SHOPPING_CART values ('SC0007','BN0005',200,'28-OCT-2007',5);
Insert into SHOPPING_CART values ('SC0008','BN0006',100,'25-NOV-2009',7);
Insert into SHOPPING_CART values ('SC0009','BN0006',150,'18-SPET-2009',8);

h.	ORDER_DETAILS
Order _ID	Customer
_ID	Shipping_ Type	Date _of _Purchase	Shopping _Cart _ID
Insert into ORDER_DETAILS values ('OD0001','CN0001','USPS','12-JUN-2001','SC0002');
Insert into ORDER_DETAILS values ('OD0002','CN0002','USPS','28-JUN-2005','SC0005');
Insert into ORDER_DETAILS values ('OD0003','CN0003','FedEx','31-JUL-2004','SC0007');
Insert into ORDER_DETAILS values ('OD0004','CN0004','FedEx','14-AUG-2006','SC0004');
Insert into ORDER_DETAILS values ('OD0005','CN0005','FedEx','21-SEP-2006','SC0003');
Insert into ORDER_DETAILS values ('OD0006','CN0006','DHL','28-OCT-2007','SC0001');
Insert into ORDER_DETAILS values ('OD0007','CN0007','DHL','11-AUG-2007','SC0006');
Insert into ORDER_DETAILS values ('OD0008','CN0008','DHL','18-SEP-2009','SC0008');
Insert into ORDER_DETAILS values ('OD0009','CN0009','USPS','25-NOV-2009','SC0009');


i.	PURCHASE_HISTORY
Customer _ID	Order _ID
Insert into PURCHASE_HISTORY values ('CN0001','OD0001');
Insert into PURCHASE_HISTORY values ('CN0003','OD0002');
Insert into PURCHASE_HISTORY values ('CN0004','OD0005');
Insert into PURCHASE_HISTORY values ('CN0009','OD0007');


6.	Create a view named CUSTOMER_DETAILS to show the Customer Name, Customer Address, and the details of the order placed by the customer. Order the results by Customer ID.

CREATE VIEW customer_details AS
SELECT	c.customer_name, c.street_address, o.order_id, o.customer_id, o.shipping_type, o.date_of_purchase, o.shopping_cart_id
FROM	customer c JOIN order_details o ON	c.customer_id = o.customer_id;

SELECT	*
FROM	customer_details 
ORDER BY customer_id;
 
7.	Make changes to the data in the tables.
a.	Add a new book detail. Verify if the author detail for the book is available in the AUTHOR
table. If not, make an entry in the AUTHOR table.

 INSERT INTO books(book_id, book_name, author_id, price, publisher_id)
VALUES ('BN0013','Two States','AN0009','150','PN0005');

b.	Enter a shopping cart detail for the book details that you just entered in 7(a).
INSERT INTO shopping_cart(shopping_cart_id, book_id, price, Shopping_cart_date,quantity)
VALUES ('SC0010','BN0013','200',TO_DATE('12-JUN-2006','DD-MON-YYYY'),'12');

8.	Create a report that contains each customer’s history of purchasing books. Be sure to include the customer name, customer ID, book ID, date of purchase, and shopping cart ID. Save the commands that generate the report in a script file named lab_apcs_8.sql.
Note: Your results may be different.
SELECT c.customer_name CUSTOMER, c.customer_id, s.shopping_cart_id, s.book_id,o.date_of_purchase
FROM customer c JOIN order_details o
ON	o.customer_id=c.customer_id JOIN shopping_cart s
ON o.shopping_cart_id=s.shopping_cart_id;





