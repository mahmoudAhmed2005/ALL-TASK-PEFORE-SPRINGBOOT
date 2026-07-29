-- 1. Find all employees where EMPLOYEE_ID is between 100 and 105

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 105;

------------------------------------------------------

-- 2. Find all employees with EMPLOYEE_ID 151,152,153,154,155

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (151,152,153,154,155);

------------------------------------------------------

-- 3. First name starts with P or p

SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE 'P%';

------------------------------------------------------

-- 4. First name ends with A or a

SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%A';

------------------------------------------------------

-- 5. First name contains A or a

SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%A%';

------------------------------------------------------

-- 6. Third character is E or e

SELECT *
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '__E%';

------------------------------------------------------

-- 7. Employees without a manager

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

------------------------------------------------------

-- 8. Employees who have a manager

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

------------------------------------------------------

-- 9. Insert employee without manager

INSERT INTO EMPLOYEES
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
 HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES
(300, 'Mahmoud', 'Atta', 'MATTA', '0123456789',
 SYSDATE, 'IT_PROG', 7000, NULL, NULL, 60);

------------------------------------------------------

-- 10. Employees with AD_VP or IT_PROG job

SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'IT_PROG');

------------------------------------------------------

-- 11. Sort by LAST_NAME ascending

SELECT *
FROM EMPLOYEES
ORDER BY LAST_NAME ASC;

------------------------------------------------------

-- 12. Sort by HIRE_DATE descending

SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

------------------------------------------------------

-- 13. Sort by DEPARTMENT_ID then SALARY descending

SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

------------------------------------------------------

-- 14. Last name in lowercase

SELECT LOWER(LAST_NAME) AS LAST_NAME
FROM EMPLOYEES;

------------------------------------------------------

-- 15. First name in uppercase

SELECT UPPER(FIRST_NAME) AS FIRST_NAME
FROM EMPLOYEES;

------------------------------------------------------

-- 16. First and last names in title case

SELECT INITCAP(FIRST_NAME) AS FIRST_NAME,
       INITCAP(LAST_NAME) AS LAST_NAME
FROM EMPLOYEES;

------------------------------------------------------

-- 17. Find employees whose last name is Smith (case-insensitive)

SELECT *
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) = 'SMITH';

-- أو

SELECT *
FROM EMPLOYEES
WHERE LOWER(LAST_NAME) = 'smith';