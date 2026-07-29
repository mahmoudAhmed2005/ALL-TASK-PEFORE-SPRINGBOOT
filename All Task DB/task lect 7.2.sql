/*====================================================
ORACLE SQL - LEFT OUTER JOIN
====================================================*/

-- Employees and Departments

SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Products and Categories

SELECT P.PRODUCT_NAME, C.CATEGORY_NAME
FROM PRODUCTS P
LEFT JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID;


-- Students and Courses

SELECT S.STUDENT_NAME, C.COURSE_NAME
FROM STUDENTS S
LEFT JOIN COURSES C
ON S.COURSE_ID = C.COURSE_ID;


-- Orders and Customers

SELECT O.ORDER_ID, C.CUSTOMER_NAME
FROM ORDERS O
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- Departments and Managers

SELECT D.DEPT_NAME, M.MANAGER_NAME
FROM DEPARTMENTS D
LEFT JOIN MANAGERS M
ON D.MANAGER_ID = M.MANAGER_ID;


-- Books and Authors

SELECT B.TITLE, A.AUTHOR_NAME
FROM BOOKS B
LEFT JOIN AUTHORS A
ON B.AUTHOR_ID = A.AUTHOR_ID;


-- Invoices and Payments

SELECT I.INVOICE_ID, P.STATUS
FROM INVOICES I
LEFT JOIN PAYMENTS P
ON I.INVOICE_ID = P.INVOICE_ID;


-- Employees and Projects

SELECT E.EMP_NAME, P.PROJECT_NAME
FROM EMPLOYEES E
LEFT JOIN PROJECTS_ASSIGNED P
ON E.EMPLOYEE_ID = P.EMPLOYEE_ID;



/*====================================================
ORACLE SQL - RIGHT OUTER JOIN
====================================================*/


-- Departments and Employees

SELECT D.DEPT_NAME, E.EMP_NAME
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Orders and Customers

SELECT O.ORDER_ID, C.CUSTOMER_NAME
FROM ORDERS O
RIGHT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- Courses and Students

SELECT C.COURSE_NAME, S.STUDENT_NAME
FROM STUDENTS S
RIGHT JOIN COURSES C
ON S.COURSE_ID = C.COURSE_ID;


-- Projects and Employees

SELECT P.PROJECT_NAME, E.EMP_NAME
FROM EMPLOYEES E
RIGHT JOIN PROJECTS P
ON E.PROJECT_ID = P.PROJECT_ID;


-- Payment Methods and Transactions

SELECT PM.METHOD_NAME, T.TRANSACTION_ID
FROM TRANSACTIONS T
RIGHT JOIN PAYMENT_METHODS PM
ON T.PAYMENT_ID = PM.PAYMENT_ID;


-- Authors and Books

SELECT A.AUTHOR_NAME, B.TITLE
FROM BOOKS B
RIGHT JOIN AUTHORS A
ON B.AUTHOR_ID = A.AUTHOR_ID;


-- Categories and Products

SELECT C.CATEGORY_NAME, P.PRODUCT_NAME
FROM PRODUCTS P
RIGHT JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID;


-- Students and Dorm Rooms

SELECT S.STUDENT_NAME, D.ROOM_NUMBER
FROM STUDENTS S
RIGHT JOIN DORM_ROOMS D
ON S.ROOM_ID = D.ROOM_ID;



/*====================================================
FULL OUTER JOIN
====================================================*/


-- Customers and Orders

SELECT C.CUSTOMER_NAME, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;


-- Employees and Projects

SELECT E.EMP_NAME, P.PROJECT_NAME
FROM EMPLOYEES E
FULL OUTER JOIN PROJECTS P
ON E.EMPLOYEE_ID = P.EMPLOYEE_ID;


-- Products and Suppliers

SELECT P.PRODUCT_NAME, S.SUPPLIER_NAME
FROM PRODUCTS P
FULL OUTER JOIN SUPPLIERS S
ON P.SUPPLIER_ID = S.SUPPLIER_ID;


-- Students and Courses

SELECT S.STUDENT_NAME, C.COURSE_NAME
FROM STUDENTS S
FULL OUTER JOIN COURSES C
ON S.COURSE_ID = C.COURSE_ID;


-- Authors and Books

SELECT A.AUTHOR_NAME, B.TITLE
FROM AUTHORS A
FULL OUTER JOIN BOOKS B
ON A.AUTHOR_ID = B.AUTHOR_ID;


-- Employees and Departments

SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;



/*====================================================
SUBQUERIES
====================================================*/


-- Employees greater than average salary

SELECT NAME
FROM EMPLOYEES
WHERE SALARY >
(SELECT AVG(SALARY) FROM EMPLOYEES);



-- Same department as John Smith

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =
(
 SELECT DEPARTMENT_ID
 FROM EMPLOYEES
 WHERE NAME='John Smith'
);



-- Orders from New York customers

SELECT *
FROM ORDERS
WHERE CUSTOMER_ID IN
(
 SELECT CUSTOMER_ID
 FROM CUSTOMERS
 WHERE CITY='New York'
);



-- Departments without employees

SELECT *
FROM DEPARTMENTS D
WHERE NOT EXISTS
(
 SELECT 1
 FROM EMPLOYEES E
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
);



-- Second highest salary

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY <
(
 SELECT MAX(SALARY)
 FROM EMPLOYEES
);



-- Products higher than average price

SELECT *
FROM PRODUCTS
WHERE PRICE >
(
 SELECT AVG(PRICE)
 FROM PRODUCTS
);



/*====================================================
SINGLE ROW SUBQUERY
====================================================*/


-- Highest salary employee

SELECT *
FROM EMPLOYEES
WHERE SALARY =
(
 SELECT MAX(SALARY)
 FROM EMPLOYEES
);



-- Same department as Alice

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =
(
 SELECT DEPARTMENT_ID
 FROM EMPLOYEES
 WHERE NAME='Alice'
);



-- Lowest price product

SELECT *
FROM PRODUCTS
WHERE PRICE =
(
 SELECT MIN(PRICE)
 FROM PRODUCTS
);



-- Employee salary equal average

SELECT *
FROM EMPLOYEES
WHERE SALARY =
(
 SELECT AVG(SALARY)
 FROM EMPLOYEES
);



-- Earliest order

SELECT *
FROM ORDERS
WHERE ORDER_DATE =
(
 SELECT MIN(ORDER_DATE)
 FROM ORDERS
);



-- Salary greater than employee 101

SELECT NAME,SALARY
FROM EMPLOYEES
WHERE SALARY >
(
 SELECT SALARY
 FROM EMPLOYEES
 WHERE EMPLOYEE_ID=101
);



/*====================================================
MULTIPLE ROW SUBQUERY
====================================================*/


-- More than at least one employee in dept 10

SELECT *
FROM EMPLOYEES
WHERE SALARY >
ANY
(
 SELECT SALARY
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID=10
);



-- Less than all employees in dept 20

SELECT *
FROM EMPLOYEES
WHERE SALARY <
ALL
(
 SELECT SALARY
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID=20
);



-- Products equal Electronics prices

SELECT *
FROM PRODUCTS
WHERE PRICE IN
(
 SELECT PRICE
 FROM PRODUCTS
 WHERE CATEGORY='Electronics'
);



-- Employees with salaries in department 30

SELECT *
FROM EMPLOYEES
WHERE SALARY IN
(
 SELECT SALARY
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID=30
);