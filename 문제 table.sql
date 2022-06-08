-- 1) employees ���̺��� ������ emp_deptno ���̺� ����(�÷� : �μ��� �ο���, ��� �޿�, �޿��� ��, �ּ� �޿�, �ִ� �޿�)
CREATE TABLE emp_deptno("�μ���ȣ", "�ο���", "��� �޿�", "�޿��� ��", "�ּ� �޿�", "�ִ� �޿�")
AS SELECT department_id, COUNT(*), ROUND(AVG(salary)), SUM(salary),
          MIN(salary), MAX(salary)
   FROM employees
   GROUP BY department_id;

-- 2) emp_deptno ���̺� �ڷ����� VARCHAR2(50)�� etc �÷� �߰�
ALTER TABLE emp_deptno
ADD etc VARCHAR2(50);

-- 3) emp_deptno ���̺��� etc�� �ڷ����� VARCHAR2(15)�� ����
ALTER TABLE emp_deptno
MODIFY etc VARCHAR2(15);

-- 4) emp_deptno ���̺��� etc ����
ALTER TABLE emp_deptno
DROP COLUMN etc;

-- 5) emp_deptno ���̺� �̸��� emp_dept�� ����
ALTER TABLE emp_deptno
RENAME TO emp_dept;

-- 6) emp_dept ���̺� ����
DROP TABLE emp_dept;