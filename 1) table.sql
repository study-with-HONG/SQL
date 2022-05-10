-- ���̺� ����
CREATE TABLE test01(
   col1 NUMBER,
   col2 VARCHAR2(10),
   col3 DATE
);

-- ���̺� ���� : ������ ����
CREATE TABLE copy_o AS
SELECT employee_id, first_name, salary FROM employees;

-- ���̺� ���� : ������ ������, �÷��� ������.
CREATE TABLE copy_x AS
SELECT * FROM employees WHERE 1 = 2; -- �������� �ʴ� ������ �ۼ�

CREATE TABLE test02(num, name, money) AS -- �÷��� ���� ����
SELECT employee_id, first_name, salary FROM employees WHERE 1 = 2;

-- ���̺� �� ����
ALTER TABLE test02
RENAME TO test22;

-- ���̺� �÷��߰�
ALTER TABLE test22
ADD email NUMBER;

-- ���̺� �÷�����
ALTER TABLE test22
MODIFY email VARCHAR2(20);

-- ���̺� �÷�����
ALTER TABLE test22
DROP COLUMN email;