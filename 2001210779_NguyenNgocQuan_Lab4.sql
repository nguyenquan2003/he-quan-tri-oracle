-- Create the department table
//Cau 1
CREATE TABLE department (
  DNAME VARCHAR2(15) NOT NULL,
  DNUMBER NUMBER(4) PRIMARY KEY,
  MGRSSN CHAR(9),
  MGRSTARTDATE DATE
);

-- Create the employee table
CREATE TABLE employee (
  FNAME VARCHAR2(15) NOT NULL,
  MINIT CHAR(1),
  LNAME VARCHAR2(15) NOT NULL,
  SSN CHAR(9) PRIMARY KEY,
  BDATE DATE,
  ADDRESS VARCHAR2(50),
  SEX CHAR(1),
  SALARY NUMBER(10,2),
  SUPERSSN CHAR(9),
  DNO NUMBER(4)
);

-- Create the dept_locations table
CREATE TABLE dept_locations (
  DNUMBER NUMBER(4),
  DLOCATION VARCHAR2(15),
  PRIMARY KEY (DNUMBER, DLOCATION)
);

-- Create the project table
CREATE TABLE project (
  PNAME VARCHAR2(20) NOT NULL,
  PNUMBER NUMBER(4) PRIMARY KEY,
  PLOCATION VARCHAR2(15),
  DNUM NUMBER(4)
);

-- Create the works_on table
CREATE TABLE works_on (
  ESSN CHAR(9),
  PNO NUMBER(4),
  HOURS NUMBER(4,1),
  PRIMARY KEY (ESSN, PNO)
);

-- Create the dependent table
CREATE TABLE dependent (
  ESSN CHAR(9),
  DEPENDENT_NAME VARCHAR2(15),
  SEX CHAR(1),
  BDATE DATE,
  RELATIONSHIP VARCHAR2(8),
  PRIMARY KEY (ESSN, DEPENDENT_NAME)
);

-- Define foreign key constraints
ALTER TABLE employee
  ADD CONSTRAINT fk_employee_department FOREIGN KEY (DNO) REFERENCES department(DNUMBER);

ALTER TABLE dept_locations
  ADD CONSTRAINT fk_dept_locations_department FOREIGN KEY (DNUMBER) REFERENCES department(DNUMBER);

ALTER TABLE project
  ADD CONSTRAINT fk_project_department FOREIGN KEY (DNUM) REFERENCES department(DNUMBER);

ALTER TABLE works_on
  ADD CONSTRAINT fk_works_on_employee FOREIGN KEY (ESSN) REFERENCES employee(SSN);

ALTER TABLE works_on
  ADD CONSTRAINT fk_works_on_project FOREIGN KEY (PNO) REFERENCES project(PNUMBER);

ALTER TABLE dependent
  ADD CONSTRAINT fk_dependent_employee FOREIGN KEY (ESSN) REFERENCES employee(SSN);


//Bai 2
INSERT INTO Department VALUES ('RESEARCH', 5, '333445555', TO_DATE('1988-05-22', 'YYYY-MM-DD'));
INSERT INTO Department VALUES ('ADMINISTRATION', 4, '987654321', TO_DATE('1995-01-01', 'YYYY-MM-DD'));
INSERT INTO Department VALUES ('HEADQUARTERS', 1, '888665555', TO_DATE('1981-06-19', 'YYYY-MM-DD'));

INSERT INTO employee VALUES ('John', 'B', 'Smith', '123456789', TO_DATE('1965-01-09', 'YYYY-MM-DD'), '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', '333445555', TO_DATE('1955-12-08', 'YYYY-MM-DD'), '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO employee VALUES ('Alicia', 'J', 'Zelaya', '999887777', TO_DATE('1968-07-19', 'YYYY-MM-DD'), '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO employee VALUES ('Jennifer', 'S', 'Wallace', '987654321', TO_DATE('1941-06-20', 'YYYY-MM-DD'), '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', TO_DATE('1962-09-15', 'YYYY-MM-DD'), '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO employee VALUES ('Joyce', 'A', 'English', '453453453', TO_DATE('1972-07-31', 'YYYY-MM-DD'), '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', TO_DATE('1969-03-29', 'YYYY-MM-DD'), '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO employee VALUES ('James', 'E', 'Borg', '888665555', TO_DATE('1937-11-10', 'YYYY-MM-DD'), '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

ALTER TABLE employee
  ADD CONSTRAINT fk_employee_manager FOREIGN KEY (SUPERSSN) REFERENCES employee(SSN);
  
INSERT INTO DEPT_LOCATIONS VALUES (1, 'Houston');
INSERT INTO DEPT_LOCATIONS VALUES (4, 'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Sugarland'); 
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Houston');

INSERT INTO PROJECT VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO WORKS_ON VALUES ('123456789', 1, 32.5);
INSERT INTO WORKS_ON VALUES ('123456789', 2, 7.5);
INSERT INTO WORKS_ON VALUES ('666884444', 3, 40.0);
INSERT INTO WORKS_ON VALUES ('453453453', 1, 20.0);
INSERT INTO WORKS_ON VALUES ('453453453', 2, 20.0);
INSERT INTO WORKS_ON VALUES ('333445555', 1, 10.0);
INSERT INTO WORKS_ON VALUES ('333445555', 2, 10.0);
INSERT INTO WORKS_ON VALUES ('333445555', 3, 10.0);
INSERT INTO WORKS_ON VALUES ('333445555', 10, 10.0);
INSERT INTO WORKS_ON VALUES ('333445555', 20, 10.0);
INSERT INTO WORKS_ON VALUES ('999887777', 30, 30.0);
INSERT INTO WORKS_ON VALUES ('999887777', 10, 10.0);
INSERT INTO WORKS_ON VALUES ('987987987', 10, 35.0);
INSERT INTO WORKS_ON VALUES ('987987987', 30, 5.0);
INSERT INTO WORKS_ON VALUES ('987654321', 30, 25.0);
INSERT INTO WORKS_ON VALUES ('987654321', 20, 15.0);
INSERT INTO WORKS_ON VALUES ('888665555', 20, NULL);

INSERT INTO DEPENDENT VALUES ('333445555', 'Alice', 'F',TO_DATE('1986-04-05', 'YYYY-MM-DD'), 'Daughter');
INSERT INTO DEPENDENT VALUES ('333445555', 'Theodore', 'M', TO_DATE('1983-10-25', 'YYYY-MM-DD'), 'Son');
INSERT INTO DEPENDENT VALUES ('333445555', 'Joy', 'F', TO_DATE('1958-05-03', 'YYYY-MM-DD'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('987987987', 'Abner', 'M', TO_DATE('1942-02-28', 'YYYY-MM-DD'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('123456789', 'Michael', 'M', TO_DATE('1988-01-04', 'YYYY-MM-DD'), 'Son');
INSERT INTO DEPENDENT VALUES ('123456789', 'Alice', 'F', TO_DATE('1988-12-30', 'YYYY-MM-DD'), 'Daughter');
INSERT INTO DEPENDENT VALUES ('123456789', 'Elizabeth', 'F', TO_DATE('1967-05-05', 'YYYY-MM-DD'), 'Spouse');

//Bai 3
--a. 
SELECT e.fname, e.lname
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON w.pno = p.pnumber
JOIN department d ON e.dno = d.dnumber
WHERE d.dname = 'RESEARCH' AND p.pname = 'ProductX' AND w.hours > 10;


--b.
SELECT fname, DEPENDENT_NAME
FROM employee 
JOIN dependent ON SSN = ESSN
WHERE fname = DEPENDENT_NAME;

--c.
SELECT e.fname, e.lname
FROM employee e
JOIN employee m ON e.superssn = m.ssn
WHERE m.fname = 'Franklin' AND m.lname = 'Wong';

--d. 
SELECT p.pname, SUM(w.hours) AS total_weekly_hours
FROM project p
JOIN works_on w ON p.pnumber = w.pno
GROUP BY p.pname;

--e.
SELECT p.pname, e.fname, e.lname
FROM project p
JOIN works_on w ON p.pnumber = w.pno
JOIN employee e ON e.ssn = w.essn
GROUP BY p.pname, e.fname, e.lname
ORDER BY p.pname, e.fname;

--f.
SELECT e.fname, e.lname
FROM employee e
LEFT JOIN works_on w ON e.ssn = w.essn
WHERE w.pno IS NULL;

--g. 
SELECT d.dname, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.dno = d.dnumber
GROUP BY d.dname;

--h. 
SELECT AVG(salary) AS avg_salary
FROM employee
WHERE sex = 'F';

--i.
SELECT DISTINCT e.fname, e.lname, e.address
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON p.pnumber = w.pno
JOIN department d ON e.dno = d.dnumber
JOIN DEPT_LOCATIONS dl ON d.dnumber = dl.dnumber
WHERE p.plocation = 'Houston' AND dl.dlocation != 'Houston';

--k. 
SELECT e.lname
FROM employee e
JOIN department d ON e.dno = d.dnumber
WHERE d.mgrssn = e.ssn AND NOT EXISTS (
    SELECT * FROM dependent dep
    WHERE dep.essn = e.ssn
);

--Cau 4
--a.
UPDATE employee
SET address = '123 Lý Th??ng Ki?t F.14 Q.10'
WHERE ssn = '123456789';

SELECT * FROM employee;

--b.
UPDATE dependent
SET relationship = 'Friend'
WHERE DEPENDENT_NAME = 'Joy' AND essn = (
    SELECT ssn FROM employee WHERE fname = 'Franklin'
);

SELECT * FROM dependent;

--c.
UPDATE EMPLOYEE
SET SALARY = SALARY * 2
WHERE DNO = (SELECT DNUMBER FROM DEPARTMENT WHERE DNAME = 'Research');

--d.
UPDATE employee e
SET salary = salary * 0.95
WHERE ssn IN (
    SELECT w.essn
    FROM works_on w
    GROUP BY w.essn
    HAVING SUM(hours) < 40
);

SELECT * FROM employee

--Bai 5
--a
DELETE FROM WORKS_ON
WHERE PNO = (SELECT PNUMBER FROM PROJECT WHERE PNAME = 'ProductZ');

DELETE FROM PROJECT
WHERE PNAME = 'ProductZ';
--b
DELETE FROM WORKS_ON
WHERE ESSN IN (SELECT SSN FROM EMPLOYEE WHERE SUPERSSN = '999887777');


DELETE FROM DEPENDENT
WHERE ESSN IN (SELECT SSN FROM EMPLOYEE WHERE SUPERSSN = '999887777');

DELETE FROM EMPLOYEE
WHERE SUPERSSN = '999887777';
