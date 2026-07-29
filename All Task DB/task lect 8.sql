/************************************************************
1) HR SCHEMA
LOCATIONS + COUNTRIES
************************************************************/


-- NATURAL JOIN

SELECT *
FROM LOCATIONS
NATURAL JOIN COUNTRIES;



-- JOIN USING COUNTRY_ID

SELECT *
FROM LOCATIONS
JOIN COUNTRIES
USING(COUNTRY_ID);



-- JOIN ON COUNTRY_ID

SELECT *
FROM LOCATIONS L
JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;



-- INNER JOIN

SELECT *
FROM LOCATIONS L
INNER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;



-- LEFT JOIN

SELECT *
FROM LOCATIONS L
LEFT JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;



-- RIGHT JOIN

SELECT *
FROM LOCATIONS L
RIGHT JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;



-- FULL JOIN

SELECT *
FROM LOCATIONS L
FULL OUTER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;





/************************************************************
2) JOBS + JOB_HISTORY
************************************************************/


-- NATURAL JOIN

SELECT *
FROM JOBS
NATURAL JOIN JOB_HISTORY;



-- USING
-- (JOB_ID is the common column)

SELECT *
FROM JOBS
JOIN JOB_HISTORY
USING(JOB_ID);



-- ON

SELECT *
FROM JOBS J
JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;



-- INNER JOIN

SELECT *
FROM JOBS J
INNER JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;



-- LEFT JOIN

SELECT *
FROM JOBS J
LEFT JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;



-- RIGHT JOIN

SELECT *
FROM JOBS J
RIGHT JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;



-- FULL JOIN

SELECT *
FROM JOBS J
FULL OUTER JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;




/************************************************************
3) SUBQUERY
Get JOB_HISTORY where JOB_ID in values
************************************************************/


SELECT *
FROM JOB_HISTORY
WHERE JOB_ID IN
(
 'AD_ASST',
 'FI_MGR',
 'FI_ACCOUNT',
 'AC_MGR',
 'AC_ACCOUNT',
 'SA_MAN',
 'SA_REP',
 'PU_MAN'
);



/************************************************************
4) SUBQUERY
Get Departments with specific names
************************************************************/


SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN
(
 'Administration',
 'Marketing',
 'Purchasing',
 'Human Resources',
 'Shipping'
);





/************************************************************
5) CREATE USER
************************************************************/


-- Connect as SYSTEM

CREATE USER MAHMOUD
IDENTIFIED BY 123456;



/************************************************************
6) GRANT PRIVILEGES
************************************************************/


GRANT CREATE SESSION
TO MAHMOUD;


GRANT CREATE TABLE
TO MAHMOUD;


GRANT INSERT, SELECT, UPDATE, DELETE
ON HR.STUDENT
TO MAHMOUD;




/************************************************************
7) Connect with MAHMOUD USER
Create Student table
************************************************************/


CREATE TABLE STUDENT
(
    ID NUMBER,
    NAME VARCHAR2(50)
);



/************************************************************
8) Insert Data
************************************************************/


INSERT INTO STUDENT
VALUES(1,'Ahmed');


INSERT INTO STUDENT
VALUES(2,'Ali');


COMMIT;



/************************************************************
9) HR Schema Operations
************************************************************/


-- HR gives privilege on Student table

GRANT INSERT,SELECT,UPDATE,DELETE
ON STUDENT
TO MAHMOUD;



-- Insert

INSERT INTO STUDENT
VALUES(3,'Sara');


-- Select

SELECT *
FROM STUDENT;


-- Update

UPDATE STUDENT
SET NAME='Mona'
WHERE ID=3;


-- Delete

DELETE FROM STUDENT
WHERE ID=3;


COMMIT;




/************************************************************
10) REVOKE ALL PRIVILEGES
************************************************************/


REVOKE ALL PRIVILEGES
FROM MAHMOUD;


-- Or remove specific table privileges

REVOKE INSERT,SELECT,UPDATE,DELETE
ON STUDENT
FROM MAHMOUD;