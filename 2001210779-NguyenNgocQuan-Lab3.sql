CREATE TABLE MESSAGES (
  NUMCOL1 NUMBER(9,2),
  NUMCOL2 NUMBER(9,2),
  CHARCOL1 VARCHAR2(60),
  CHARCOL2 VARCHAR2(60),
  DATECOL1 DATE,
  DATECOL2 DATE
);

--Cau 1
SET SERVEROUTPUT ON;
DECLARE
    V_BOOL1 BOOLEAN;
    V_BOOL2 BOOLEAN;
    V_CHAR VARCHAR2(50);  
    V_NUM NUMBER;
BEGIN
    V_CHAR := '42 is the answer';
    V_NUM := TO_NUMBER(SUBSTR(V_CHAR, 1, 2));
    IF V_NUM < 100 THEN
        V_BOOL1 := TRUE;
    ELSE
        V_BOOL1 := FALSE;
    END IF;
    V_BOOL2 := NOT V_BOOL1;
    DBMS_OUTPUT.PUT_LINE('V_CHAR: ' || V_CHAR);
    DBMS_OUTPUT.PUT_LINE('V_NUM: ' || V_NUM);
    DBMS_OUTPUT.PUT_LINE('V_BOOL1: ' || CASE WHEN V_BOOL1 THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('V_BOOL2: ' || CASE WHEN V_BOOL2 THEN 'TRUE' ELSE 'FALSE' END);
END;
/


--Câu 2
DECLARE

  v_base NUMBER := 10; 
  v_exponent NUMBER := 2; 

 
  v_result NUMBER;

  v_result_bind NUMBER;
BEGIN
  v_result := Power(v_base,v_exponent);

  INSERT INTO MESSAGES (NUMCOL1)
  VALUES (v_result);

  v_result_bind := v_result;

  DBMS_OUTPUT.PUT_LINE('K?t qu?: ' || v_result);
END;
/


--Câu 3

DECLARE
  v_row_count NUMBER := 0;

BEGIN
  FOR i IN 1..10 LOOP
    -- Tãng s? ð?m
    v_row_count := v_row_count + 1;

    IF v_row_count NOT IN (6, 8) THEN
      INSERT INTO MESSAGES (NUMCOL1)
      VALUES (v_row_count);

      COMMIT;
    END IF;
  END LOOP;
END;
/

select * from MESSAGES;

--Cau 04---
DECLARE
    v NUMBER;
BEGIN
    FOR v IN 1..10 LOOP
        UPDATE MESSAGES
        SET NUMCOL2 = 100
        WHERE NUMCOL1 = v;
       
        IF SQL%ROWCOUNT = 0 OR SQL%ROWCOUNT > 1 THEN
            DBMS_OUTPUT.PUT_LINE('Exit loop: v = ' || v || ', Rows affected: ' || SQL%ROWCOUNT);
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('C?p nh?t : v = ' || v || ', Rows affected: ' || SQL%ROWCOUNT);
        END IF;
    END LOOP;
   
    COMMIT;
END;

--Câu 5
DECLARE
  v_base NUMBER := 10; 
  v_exponent NUMBER := 2; 

  v_result NUMBER(1); 

  v_result_bind NUMBER;

  v_error_message VARCHAR2(200);
BEGIN
  BEGIN
    v_result := Power(v_base, v_exponent);

    INSERT INTO MESSAGES (NUMCOL1)
    VALUES (v_result);

    v_result_bind := v_result;

    DBMS_OUTPUT.PUT_LINE('K?t qu?: ' || v_result);
  EXCEPTION
    WHEN OTHERS THEN
      v_error_message := DBMS_INFO.LAST_RETURNED_STRING;

      INSERT INTO MESSAGES (NUMCOL1, NUMCOL2)
      VALUES (v_result, v_error_message);

      DBMS_OUTPUT.PUT_LINE('L?i: ' || v_error_message);
  END;
END;
/

--Câu 06--
CREATE TABLE Dept (
    ID     NUMBER,
    dname  VARCHAR2(100),
    loc    VARCHAR2(100)
);

INSERT INTO Dept (ID, dname, loc) VALUES (1, 'SALES', 'Chicago');
INSERT INTO Dept (ID, dname, loc) VALUES (2, 'HR', 'San Francisco');
INSERT INTO Dept (ID, dname, loc) VALUES (3, 'IT', 'Los Angeles');
INSERT INTO Dept (ID, dname, loc) VALUES (4, 'MARKETING', 'San Francisco');
INSERT INTO Dept (ID, dname, loc) VALUES (5, 'SALES', 'Texas');

DECLARE
    CURSOR dept_cursor IS
        SELECT ID, dname, loc
        FROM Dept
        FOR UPDATE;
   
    v_ID    Dept.ID%TYPE;
    v_dname Dept.dname%TYPE;
    v_loc   Dept.loc%TYPE;
   
    sales_count    NUMBER := 0;
    new_york_count NUMBER := 0;
BEGIN
    OPEN dept_cursor;
   
    LOOP
        FETCH dept_cursor INTO v_ID, v_dname, v_loc;
        EXIT WHEN dept_cursor%NOTFOUND;
       
        IF v_dname = 'SALES' THEN
            UPDATE Dept
            SET loc = 'Dallas'
            WHERE CURRENT OF dept_cursor;
            sales_count := sales_count + 1;
        ELSE
            UPDATE Dept
            SET loc = 'New York'
            WHERE CURRENT OF dept_cursor;
            new_york_count := new_york_count + 1;
        END IF;
    END LOOP;
   
    CLOSE dept_cursor;
   
    COMMIT;
   
    DBMS_OUTPUT.PUT_LINE('Number of SALES departments moved to Dallas: ' || sales_count);
    DBMS_OUTPUT.PUT_LINE('Number of other departments moved to New York: ' || new_york_count);
END;


