CREATE TABLE EMPLOYEE2(
  FNAME VARCHAR2(50), MINIT VARCHAR2(3), LNAME VARCHAR2(50), SSN VARCHAR2(50) PRIMARY KEY,
  BDATE DATE,
  ADDRESS VARCHAR2(500), SEX VARCHAR2(3), SALARY INT, SUPERSSN VARCHAR2(50), DNO INT
);

CREATE TABLE DEPARTMENT2(
  DNAME VARCHAR2(50),
  DNUMBER INT PRIMARY KEY,
  MGRSSN VARCHAR2(50),
  MGRSTARTDATE DATE
);

CREATE TABLE DEPT_LOCATIONS2 (
  DNUMBER INT, DLOCATION VARCHAR2(50),
  PRIMARY KEY (DNUMBER, DLOCATION),
  FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENT2(DNUMBER)
);

CREATE TABLE PROJECT2 (
  PNAME VARCHAR2(50), PNUMBER INT PRIMARY KEY,
PLOCATION VARCHAR2(50),DNUM INT
);

CREATE TABLE WORK_ON2(
  ESSN VARCHAR2(50),PNO INT,HOURS FLOAT,
  PRIMARY KEY (ESSN,PNO)
);

CREATE TABLE DEPENDENT2 (
    ESSN VARCHAR2(50),
    DEPENDENT_NAME VARCHAR2(50),
    SEX VARCHAR2(3),
    BDATE DATE,
    RELATIONSHIP VARCHAR2(50),
    PRIMARY KEY (ESSN, DEPENDENT_NAME),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE2(SSN)
);
----------------

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('John', 'B', 'Smith', '123456789', TO_DATE('1965-01-09', 'YYYY-MM-DD'), '731 Fondren, Houston, TX', 'M', 30000, '333445555', 1);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('Franklin', 'T', 'Wong', '333445556', TO_DATE('1955-12-08', 'YYYY-MM-DD'), '638 Voss, Houston, TX', 'M', 40000, '888665555', 1);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('Alicia', 'J', 'Zelaya', '999887778', TO_DATE('1968-07-19', 'YYYY-MM-DD'), '3321 Castle, Spring, TX', 'F', 25000, '987654321', 1);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('Jennifer', 'S', 'Ramesh', '987654322', TO_DATE('1941-06-20', 'YYYY-MM-DD'), '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 2);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('K', 'W', 'Narayan', '666884444', TO_DATE('1962-09-15', 'YYYY-MM-DD'), '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 2);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('Joyce', 'A', 'English', '453453454', TO_DATE('1972-07-31', 'YYYY-MM-DD'), '5631 Rice, Houston, TX', 'F', 25000, '333445555', 3);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('Ahmad', 'V', 'Jabbar', '987987988', TO_DATE('1969-03-29', 'YYYY-MM-DD'), '980 Dallas, Houston, TX', 'M', 25000, '987654321', 3);

INSERT INTO EMPLOYEE2 (FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('James', 'E', 'Borg', '888665555', TO_DATE('1937-11-10', 'YYYY-MM-DD'), '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

-----------------------------------

INSERT INTO DEPARTMENT2 (DNAME, DNUMBER, MGRSSN, MGRSTARTDATE)
VALUES ('Research', 5, '333445555', TO_DATE('1988-05-22', 'YYYY-MM-DD'));

INSERT INTO DEPARTMENT2 (DNAME, DNUMBER, MGRSSN, MGRSTARTDATE)
VALUES ('Administration', 4, '987654321', TO_DATE('1995-01-01', 'YYYY-MM-DD'));

INSERT INTO DEPARTMENT2 (DNAME, DNUMBER, MGRSSN, MGRSTARTDATE)
VALUES ('Headquarters', 1, '888665555', TO_DATE('1981-06-19', 'YYYY-MM-DD'));

-----------------

INSERT INTO DEPT_LOCATIONS2 (DNUMBER, DLOCATION) VALUES (1, 'Houston');
INSERT INTO DEPT_LOCATIONS2 (DNUMBER, DLOCATION) VALUES (4, 'Stafford');
INSERT INTO DEPT_LOCATIONS2 (DNUMBER, DLOCATION) VALUES (5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS2 (DNUMBER, DLOCATION) VALUES (5, 'Sugarland');
INSERT INTO DEPT_LOCATIONS2 (DNUMBER, DLOCATION) VALUES (5, 'Houston');

----------
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT2 (PNAME, PNUMBER, PLOCATION, DNUM) VALUES ('Newbenefits', 30, 'Stafford', 4);
------------------

INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('123456789', 1, 32.5);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('123456789', 2, 7.5);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('666884444', 453453453, NULL);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('453453453', 3122, 40.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('333445555', 3, 10.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('333445555', 10, 10.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('333445555', 20, 10.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('999887777', 30, 30.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('999887777', 10, 10.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('987987987', 10, 35.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('987987987', 30, 5.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('987654321', 30, 20.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('987654321', 20, 15.0);
INSERT INTO WORK_ON2 (ESSN, PNO, HOURS) VALUES ('888665555', 20, NULL);

select * from dependent2;

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('333445555', 'Alice', 'F', TO_DATE('1986-04-05', 'YYYY-MM-DD'), 'DAUGHTER');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('333445555', 'Theodore', 'M', TO_DATE('1983-10-25', 'YYYY-MM-DD'), 'SON');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('333445555', 'Joy', 'F', TO_DATE('1958-05-03', 'YYYY-MM-DD'), 'SPOUSE');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('987654321', 'Abner', 'M', TO_DATE('1942-02-28', 'YYYY-MM-DD'), 'SPOUSE');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('123456789', 'Michael', 'M', TO_DATE('1988-01-04', 'YYYY-MM-DD'), 'SON');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('123456789', 'Alice', 'F', TO_DATE('1988-12-30', 'YYYY-MM-DD'), 'DAUGHTER');

INSERT INTO DEPENDENT2 (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES
('123456789', 'Elizabeth', 'F', TO_DATE('1967-05-05', 'YYYY-MM-DD'), 'SPOUSE');

------------------------------------------------------------------------------------------------
--b. T?o view
CREATE VIEW v_emp_supervised_by_333445555 AS
SELECT e.ssn AS empno, e.fname || ' ' || e.lname AS fullname, e.salary, SUM(w.hours) AS total_weekly_hours
FROM employee2 e
LEFT JOIN work_on2 w ON e.ssn = w.essn
WHERE e.superssn = '333445555'
GROUP BY e.ssn, e.fname, e.lname, e.salary;
--Xem view 
SELECT * FROM v_emp_supervised_by_333445555;
--c. T?o view 
CREATE VIEW v_manager_dept_info AS
SELECT e.ssn AS empno, e.fname || ' ' || e.lname AS fullname, e.salary, d.dname, COUNT(e2.ssn) AS total_employees
FROM employee2 e
JOIN department2 d ON e.superssn = d.mgrssn
LEFT JOIN employee2 e2 ON e.ssn = e2.superssn
GROUP BY e.ssn, e.fname, e.lname, e.salary, d.dname
WITH READ ONLY;
--Xem view 
SELECT * FROM v_manager_dept_info;
--a. T?o trigger
CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE INSERT OR UPDATE ON employee2
FOR EACH ROW
DECLARE
BEGIN
IF :NEW.salary < 0 THEN
RAISE_APPLICATION_ERROR(-20001, 'Ti?n l��ng kh�ng l� s? �m');
END IF;
END;
--c. T?o trigger
CREATE OR REPLACE TRIGGER trg_manage_department
BEFORE INSERT OR UPDATE ON department2
FOR EACH ROW
DECLARE
  v_emp_age NUMBER;
BEGIN
  SELECT (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM hire_date)) INTO v_emp_age
  FROM employee2
  WHERE employee_id = :NEW.manager_id;
  IF v_emp_age < 30 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Nh�n vi�n qu?n l? ph?i tr�n 30 tu?i.');
  ELSE
    UPDATE employee2
    SET salary = salary * 1.5
    WHERE employee_id = :NEW.manager_id;
  END IF;
END;
--T?o procedure
CREATE OR REPLACE PROCEDURE get_employee_salary_grade
IS
    CURSOR emp_cursor IS
        SELECT LNAME, FNAME, SALARY
        FROM EMPLOYEE2;
    v_lname EMPLOYEE2.LNAME%TYPE;
    v_fname EMPLOYEE2.FNAME%TYPE;
    v_salary EMPLOYEE2.SALARY%TYPE;
    v_grade VARCHAR2(1);
BEGIN
    FOR rec IN emp_cursor LOOP
        IF rec.SALARY < 35000 THEN
            v_grade := 'C';
        ELSIF rec.SALARY >= 35000 AND rec.SALARY < 50000 THEN
            v_grade := 'B';
        ELSE
            v_grade := 'A';
        END IF;
        DBMS_OUTPUT.PUT_LINE(rec.FNAME || ' ' || rec.LNAME || ': $' || rec.SALARY || ' ' || v_grade);
    END LOOP;
END;
-- select * from EMPLOYEE2
EXECUTE get_employee_salary_grade;