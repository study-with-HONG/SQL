/*  ���� ������ �ִ� ��� ���̺� ��ȸ  */
SELECT * FROM TAB;

/*  ���̺� �ִ� ��� ������ ��ȸ  */
SELECT * FROM employees;

/*  ���̺� �ִ� ��� �÷� ��ȸ  */
DESC employees;

/*  �÷� ����  */
SELECT last_name, salary, salary+500 FROM employees;

SELECT last_name, salary, salary*12 FROM employees;

SELECT first_name || ' ' || salary FROM employees; -- ��Ŭ���������� ;������ �۵�

/*  ALIAS : �÷� ����, ���� ����  */
SELECT employee_id AS �����ȣ, salary ���� FROM employees;

/*  DISTINCT : �ߺ��� ����  */
SELECT DISTINCT job_id FROM employees;

/*  DUAL : �������̺�, �ӽ����̺�  */
SELECT 1, 'A' FROM DUAL;

SELECT 'A' FROM DUAL;

SELECT TO_DATE('20211222', 'YYYYMMDD') FROM DUAL;

/*  ������ ����  */
PURGE RECYCLEBIN;