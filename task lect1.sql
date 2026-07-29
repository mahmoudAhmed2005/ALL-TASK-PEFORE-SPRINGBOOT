-- 1. Create table MANGER
CREATE TABLE MANGER (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER,
    BIRTH_DATE DATE,
    ADDRESS VARCHAR2(200)
);

--------------------------------------------------

-- 2. Drop ADDRESS column
ALTER TABLE MANGER
DROP COLUMN ADDRESS;

--------------------------------------------------

-- 3. Add CITY_ADDRESS and STREET columns
ALTER TABLE MANGER
ADD (
    CITY_ADDRESS VARCHAR2(100),
    STREET VARCHAR2(100)
);

--------------------------------------------------

-- 4. Rename NAME column to FULL_NAME
ALTER TABLE MANGER
RENAME COLUMN NAME TO FULL_NAME;

--------------------------------------------------

-- 5. Make the table read only
ALTER TABLE MANGER READ ONLY;

-- To make it writable again:
-- ALTER TABLE MANGER READ WRITE;

--------------------------------------------------

-- 6. Create OWNER table with only
-- ID, FULL_NAME, BIRTH_DATE

CREATE TABLE OWNER AS
SELECT ID, FULL_NAME, BIRTH_DATE
FROM MANGER
WHERE 1 = 0;

--------------------------------------------------

-- 7. Rename MANGER to MASTER
RENAME MANGER TO MASTER;

--------------------------------------------------

-- 8. Drop all tables

DROP TABLE OWNER;

DROP TABLE MASTER;

-- If there are foreign keys:
-- DROP TABLE OWNER CASCADE CONSTRAINTS;
-- DROP TABLE MASTER CASCADE CONSTRAINTS;