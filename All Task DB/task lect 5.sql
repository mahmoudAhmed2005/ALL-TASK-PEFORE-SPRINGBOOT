
CREATE TABLE PLAYER
(
    ID NUMBER NOT NULL UNIQUE,
    NAME VARCHAR2(100) UNIQUE,
    AGE NUMBER
);



/*====================================================
2) CREATE MANAGER TABLE
Requirement:
- id NOT NULL
- id and name UNIQUE together
====================================================*/

CREATE TABLE MANAGER
(
    ID NUMBER NOT NULL,
    NAME VARCHAR2(100),
    SALARY NUMBER,

    CONSTRAINT UK_MANAGER_ID_NAME
    UNIQUE(ID,NAME)
);



/*====================================================
3) CREATE MANAGER TABLE
Requirement:
- id Primary Key
- Primary Key = NOT NULL + UNIQUE
====================================================*/

CREATE TABLE MANAGER2
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER
);



/*====================================================
4) DOCTOR - PATIENT
Relation:
Doctor  Many To Many  Patient
====================================================*/


CREATE TABLE DOCTOR
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    SALARY NUMBER
);


CREATE TABLE PATIENT
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER
);


CREATE TABLE DOCTOR_PATIENT
(
    DOCTOR_ID NUMBER,
    PATIENT_ID NUMBER,

    CONSTRAINT FK_DOCTOR
    FOREIGN KEY(DOCTOR_ID)
    REFERENCES DOCTOR(ID),

    CONSTRAINT FK_PATIENT
    FOREIGN KEY(PATIENT_ID)
    REFERENCES PATIENT(ID)
);



/*====================================================
5) TEACHER - LANGUAGE
Relation:
Teacher  Many To One  Language
Language One To Many Teacher
====================================================*/


CREATE TABLE LANGUAGE
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100)
);


CREATE TABLE TEACHER
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    SALARY NUMBER,

    LANGUAGE_ID NUMBER,

    CONSTRAINT FK_TEACHER_LANGUAGE
    FOREIGN KEY(LANGUAGE_ID)
    REFERENCES LANGUAGE(ID)
);



/*====================================================
6) EMPLOYEE - PHONE
Relation:
Employee One To One Phone
====================================================*/


CREATE TABLE EMPLOYEE
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER
);


CREATE TABLE PHONE
(
    ID NUMBER PRIMARY KEY,
    PHONE_NUMBER VARCHAR2(20),

    EMPLOYEE_ID NUMBER UNIQUE,

    CONSTRAINT FK_PHONE_EMPLOYEE
    FOREIGN KEY(EMPLOYEE_ID)
    REFERENCES EMPLOYEE(ID)
);