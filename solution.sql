SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Sum of two numbers = ' || (a + b));
END;
/
