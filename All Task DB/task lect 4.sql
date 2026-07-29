/*====================================================
 1) CHARACTER FUNCTIONS - TRIM, LTRIM, RTRIM
====================================================*/

CREATE TABLE EMP_TEST(
    NAME VARCHAR2(50)
);

INSERT INTO EMP_TEST VALUES('   Ahmed   ');
INSERT INTO EMP_TEST VALUES('   Ali');
INSERT INTO EMP_TEST VALUES('Mona   ');

-- TRIM remove leading and trailing spaces
SELECT TRIM(NAME) FROM EMP_TEST;

-- LTRIM remove left spaces
SELECT LTRIM(NAME) FROM EMP_TEST;

-- RTRIM remove right spaces
SELECT RTRIM(NAME) FROM EMP_TEST;

-- Remove special characters
SELECT TRIM('*' FROM '***Oracle***') FROM DUAL;
SELECT TRIM('#' FROM '###SQL###') FROM DUAL;


/*====================================================
 2) REPLACE , LPAD , RPAD
====================================================*/

SELECT REPLACE('database','a','@')
FROM DUAL;

SELECT REPLACE('This is old course','old','new')
FROM DUAL;


CREATE TABLE PRODUCT(
    PRODUCT_NAME VARCHAR2(50)
);

INSERT INTO PRODUCT VALUES('Laptop');
INSERT INTO PRODUCT VALUES('Mouse');
INSERT INTO PRODUCT VALUES('Keyboard');


SELECT LPAD(PRODUCT_NAME,15,'*')
FROM PRODUCT;


SELECT RPAD(PRODUCT_NAME,15,'#')
FROM PRODUCT;



/*====================================================
 3) TO_CHAR FUNCTION
====================================================*/

SELECT TO_CHAR(SYSDATE,'DD-MON-YYYY')
FROM DUAL;


SELECT TO_CHAR(SYSDATE,'Day, Month YYYY')
FROM DUAL;


SELECT TO_CHAR(12345.67,'99,999.99')
FROM DUAL;


SELECT TO_CHAR(5000,'$99,999')
FROM DUAL;


SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS')
FROM DUAL;



/*====================================================
 4) CASE EXPRESSIONS
====================================================*/

CREATE TABLE STUDENTS(
    NAME VARCHAR2(50),
    SCORE NUMBER
);


INSERT INTO STUDENTS VALUES('Ahmed',95);
INSERT INTO STUDENTS VALUES('Ali',85);
INSERT INTO STUDENTS VALUES('Sara',75);
INSERT INTO STUDENTS VALUES('Mona',65);
INSERT INTO STUDENTS VALUES('Omar',50);


SELECT NAME,SCORE,
CASE
 WHEN SCORE>=90 THEN 'A'
 WHEN SCORE>=80 THEN 'B'
 WHEN SCORE>=70 THEN 'C'
 ELSE 'F'
END GRADE
FROM STUDENTS;


SELECT NAME,
CASE
 WHEN SCORE>=60 THEN 'Pass'
 ELSE 'Fail'
END RESULT
FROM STUDENTS;


SELECT NAME,
CASE
 WHEN SCORE>=90 THEN 'Excellent'
 WHEN SCORE>=80 THEN 'Good'
 WHEN SCORE>=70 THEN 'Average'
 ELSE 'Needs Improvement'
END MESSAGE
FROM STUDENTS;


SELECT 'Today is '||TO_CHAR(SYSDATE,'Day')
FROM DUAL;



/*====================================================
 5) DECODE
====================================================*/

SELECT SCORE,
DECODE(SCORE,
100,'A',
90,'B',
80,'C',
'F') GRADE
FROM STUDENTS;



CREATE TABLE STATUS_LOG(
STATUS_CODE CHAR(1)
);


INSERT INTO STATUS_LOG VALUES('N');
INSERT INTO STATUS_LOG VALUES('I');
INSERT INTO STATUS_LOG VALUES('C');


SELECT STATUS_CODE,
DECODE(STATUS_CODE,
'N','New',
'I','In Progress',
'C','Completed')
FROM STATUS_LOG;



SELECT PRODUCT_NAME,
QUANTITY,
DECODE(QUANTITY,
0,'Out of Stock',
'Available')
FROM PRODUCTS;



SELECT DEPARTMENT,
DECODE(DEPARTMENT,
'HR',500,
'IT',1000,
'Sales',1500,
300) BONUS
FROM EMPLOYEES;



/*====================================================
 6) AGGREGATE FUNCTIONS
====================================================*/


-- Average Salary
SELECT AVG(SALARY)
FROM EMPLOYEES;


-- Count Employees
SELECT COUNT(*)
FROM EMPLOYEES;


-- Maximum Salary
SELECT MAX(SALARY)
FROM EMPLOYEES;


-- Minimum Salary
SELECT MIN(SALARY)
FROM EMPLOYEES;


-- Total Salary
SELECT SUM(SALARY)
FROM EMPLOYEES;



/*====================================================
 GROUP BY
====================================================*/


-- Average salary by department

SELECT DEPARTMENT_ID,
AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



-- Count employees by job

SELECT JOB_ID,
COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;



-- HAVING

SELECT DEPARTMENT_ID,
SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>50000;



-- Average commission

SELECT AVG(COMMISSION_PCT)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;



-- Salary greater than 10000

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY>10000;



-- Max and Min salary per job

SELECT JOB_ID,
MAX(SALARY),
MIN(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;



-- Salary per Manager

SELECT MANAGER_ID,
SUM(SALARY)
FROM EMPLOYEES
GROUP BY MANAGER_ID;



-- Department + Job

SELECT DEPARTMENT_ID,
JOB_ID,
SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,JOB_ID;



-- Jobs with more than 5 employees

SELECT JOB_ID,
COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(*)>5;



/*====================================================
 ALL AGGREGATES TOGETHER
====================================================*/

SELECT DEPARTMENT_ID,
COUNT(*) TOTAL_EMPLOYEES,
AVG(SALARY) AVG_SALARY,
MAX(SALARY) MAX_SALARY,
MIN(SALARY) MIN_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



/*====================================================
 COMPLEX HAVING
====================================================*/

SELECT DEPARTMENT_ID,
AVG(SALARY),
COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)>8000
AND COUNT(*)<10;



/*====================================================
 HIGHEST TOTAL SALARY DEPARTMENT
====================================================*/

SELECT DEPARTMENT_ID,
SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY TOTAL_SALARY DESC
FETCH FIRST 1 ROW ONLY;



/*====================================================
 ALIASES WITH AGGREGATES
====================================================*/

SELECT DEPARTMENT_ID,
SUM(SALARY) AS TOTAL_SALARY,
AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;