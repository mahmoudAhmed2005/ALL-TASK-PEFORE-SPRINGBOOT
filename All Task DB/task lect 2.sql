-- ==========================================
-- 1. Create DOCTOR Table
-- ==========================================

CREATE TABLE DOCTOR (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    SALARY NUMBER,
    ADDRESS VARCHAR2(200)
);

-- ==========================================
-- 2. Insert 10 Rows
-- ==========================================

INSERT INTO DOCTOR VALUES (1, 'Ahmed', 1000, 'Cairo');
INSERT INTO DOCTOR VALUES (2, 'Ali', 2000, 'Giza');
INSERT INTO DOCTOR VALUES (3, 'Sara', 3000, 'Alex');
INSERT INTO DOCTOR VALUES (4, 'Mona', 4000, 'Mansoura');
INSERT INTO DOCTOR VALUES (5, 'Omar', 5000, 'Tanta');
INSERT INTO DOCTOR VALUES (6, 'Youssef', 6000, 'Aswan');
INSERT INTO DOCTOR VALUES (7, 'Nour', 7000, 'Luxor');
INSERT INTO DOCTOR VALUES (8, 'Hassan', 8000, 'Suez');
INSERT INTO DOCTOR VALUES (9, 'Laila', 9000, 'Port Said');
INSERT INTO DOCTOR VALUES (10, 'Khaled', 10000, 'Zagazig');

COMMIT;

-- ==========================================
-- 3. Update Record Number 3 Salary
-- ==========================================

UPDATE DOCTOR
SET SALARY = 20000
WHERE ID = 3;

COMMIT;

-- ==========================================
-- 4. Delete Record Number 9
-- ==========================================

DELETE FROM DOCTOR
WHERE ID = 9;

COMMIT;

-- ==========================================
-- 5. Concatenate Name with Salary
-- ==========================================

SELECT NAME || ' - ' || SALARY AS NAME_AND_SALARY
FROM DOCTOR;

-- ==========================================
-- 6. Display Salary * 2
-- ==========================================

SELECT ID,
       NAME,
       SALARY,
       SALARY * 2 AS DOUBLE_SALARY
FROM DOCTOR;

-- ==========================================
-- 7. Select Salary = 1000 OR 2000 OR 3000
-- ==========================================

SELECT *
FROM DOCTOR
WHERE SALARY IN (1000, 2000, 3000);

-- ==========================================
-- 8. Rename Table
-- ==========================================

RENAME DOCTOR TO PRD_DOCTOR;

-- ==========================================
-- 9. Create EMPLOYEES Table
-- ==========================================

CREATE TABLE EMPLOYEES (
    EMPLOYEEID NUMBER PRIMARY KEY,
    FIRSTNAME VARCHAR2(50),
    LASTNAME VARCHAR2(50),
    DEPARTMENT VARCHAR2(50),
    SALARY NUMBER
);

-- ==========================================
-- 10. Insert Records
-- ==========================================

INSERT INTO EMPLOYEES VALUES (101, 'John1', 'Doe1', 'HR', 20000);
INSERT INTO EMPLOYEES VALUES (102, 'John2', 'Doe2', 'IT', 50000);
INSERT INTO EMPLOYEES VALUES (103, 'John3', 'Doe3', 'CS', 40000);
INSERT INTO EMPLOYEES VALUES (104, 'John4', 'Doe4', 'IT', 10000);
INSERT INTO EMPLOYEES VALUES (105, 'John5', 'Doe5', 'ZX', 30000);

COMMIT;

-- ==========================================
-- 11. Update Salary of EmployeeID = 101
-- ==========================================

UPDATE EMPLOYEES
SET SALARY = 600000
WHERE EMPLOYEEID = 101;

COMMIT;

-- ==========================================
-- 12. Delete Employee
-- (Corrected: Department = 'HR')
-- ==========================================

DELETE FROM EMPLOYEES
WHERE DEPARTMENT = 'HR';

COMMIT;

-- If your instructor really meant EmployeeID = 101:
-- DELETE FROM EMPLOYEES WHERE EMPLOYEEID = 101;

-- ==========================================
-- 13. Retrieve Employees in IT Department
-- ==========================================

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT = 'IT';

-- ==========================================
-- 14. Concatenate FirstName and LastName
-- ==========================================

SELECT EMPLOYEEID,
       FIRSTNAME || ' ' || LASTNAME AS FULL_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEES;