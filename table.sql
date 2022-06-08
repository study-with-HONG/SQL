/*
    Table : �⺻���� ���� ���� / row(��), column(��)
    
    table - object(create, drop, alter)
    data - insert, delete, select, update
*/
/*  CREATE TABLE ~ : ���̺� ����  */
CREATE TABLE create_test(
   col1 NUMBER,
   col2 VARCHAR2(10),
   col3 DATE
);

/*  ���̺� ���� : ������ ����  */
CREATE TABLE copy_o
AS SELECT employee_id, first_name, salary FROM employees;

/*  ���̺� ���� : ������ ������, �÷��� ����  */
CREATE TABLE copy_x
AS SELECT * FROM employees
   WHERE 1 = 2; -- �������� �ʴ� ���� �ۼ�

CREATE TABLE copyalias(num, name, money) -- �÷��� ����
AS SELECT employee_id, first_name, salary FROM employees
   WHERE 1 = 2;

/*  ALTER TABLE ~ RENAME TO ~ : ���̺� �� ����  */
ALTER TABLE copyalias
RENAME TO copyas;

/*  ALTER TABLE ~ ADD ~ : ���̺� �÷��߰�  */
ALTER TABLE copyas
ADD email NUMBER;

/*  ALTER TABL ~ MODIFY ~ : ���̺� �÷�����  */
ALTER TABLE copyas
MODIFY email VARCHAR2(20);

/*  ALTER TABL ~ DROP COLUMN ~ : ���̺� �÷�����  */
ALTER TABLE copyas
DROP COLUMN email;

/*  DROP TABLE ~ : ���̺� ����*/
DROP TABLE create_test;

/*  ������ ����  */
PURGE RECYCLEBIN;

/*  INSERT �ǽ��� ���̺� ����  */
CREATE TABLE deft(�μ���ȣ, �μ���, �Ŵ�����ȣ, ������ȣ)
AS SELECT department_id, department_name, manager_id, location_id
   FROM departments
   WHERE 1=2;

/*  INSERT INTO ~ VALUES ~ : ������ �߰�  */
INSERT INTO deft(�μ���ȣ, �μ���, �Ŵ�����ȣ, ������ȣ)
VALUES(10, '��ȹ��', 100, 123);

INSERT INTO deft(�μ���ȣ, �μ���)
VALUES(20, '������');

INSERT INTO deft -- ��� �÷��� �߰��ϸ� �÷��� ���� ����
VALUES(30, 'IT��', 333, 234);

INSERT INTO deft -- �÷����� �����ϸ� �÷��� ���� �Ұ�
VALUES(30, 'IT��', 333);

INSERT INTO deft(�μ���, �μ���ȣ, �Ŵ�����ȣ, ������ȣ)
VALUES('�渮��', 40, 200, 345);

INSERT INTO deft(�μ���ȣ, �μ���, �Ŵ�����ȣ, ������ȣ)
VALUES('50', '������', '400', '678'); -- �ڵ� ����ȯ

INSERT INTO deft(�μ���ȣ, �μ���, �Ŵ�����ȣ, ������ȣ)
VALUES(60, 100, 600, 645); -- �ڵ� ����ȯ

/*  DELETE FROM ~ [WHERE ~] : ������ ����  */
-- ���ǿ� �����ϴ� ������ ����
DELETE FROM deft
WHERE �μ���ȣ = '100';

DELETE FROM deft
WHERE ������ȣ IS NULL;

-- ������ ������ ��� ������ ����
DELETE FROM deft;

/*  UPDATE ~ SET ~ [WHERE ~] : ������ ����  */
-- ���ǿ� �����ϴ� ������ ����
UPDATE deft
SET ������ȣ = 300 WHERE �μ���ȣ = 30;

UPDATE deft
SET �μ���ȣ = 70, ������ȣ = 700 WHERE �μ��� = '������';

-- ������ ������ ��� ������ ����
UPDATE deft
SET ������ȣ = 02;