-- ����1) EMPLOYEES ���̺��� �μ��� �ο���,��� �޿�,�޿��� ��,�ּ� �޿�,�ִ� �޿��� �����ϴ�
--       EMP_DEPTNO ���̺� ����
CREATE TABLE emp_deptno("�ο���", "��� �޿�", "�޿��� ��", "�ּ� �޿�", "�ִ� �޿�") AS
SELECT COUNT(*), AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM employees
WHERE 1=2;
 
-- ����2) EMP_DEPTNO ���̺� ETC �÷� �߰�, �ڷ����� VARCHAR2(50)
ALTER TABLE emp_deptno
ADD etc VARCHAR2(50);

-- ����3) EMP_DEPTNO ���̺� ETC �÷� �ڷ��� VARCHAR2(15)�� ����
ALTER TABLE emp_deptno
MODIFY etc VARCHAR2(15);

-- ����4) EMP_DEPTNO ���̺� �ִ� ETC ����
ALTER TABLE emp_deptno
DROP COLUMN etc;

-- ����5) EMP_DEPTNO ���̺��� �̸��� EMP_DEPT�� ����
ALTER TABLE emp_deptno
RENAME TO emp_dept;

-- ����6) EMP_DEPT ���̺��� �����϶�.
DROP TABLE emp_dept;