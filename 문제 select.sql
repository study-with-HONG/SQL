/*  ��� ������ employees ���̺� ���  */
-- 1) ��� ������ ���
SELECT * FROM employees;

-- 2) ��� �÷� ���� ���
DESC employees; -- ��Ŭ���������� �ȵ�

-- 3) �����ȣ, �̸�, �޿�, ������ ���
SELECT employee_id, first_name, salary, job_id FROM employees;

-- 4) �����ȣ, �̸�, �޿�, �޿� + 300 ���
SELECT employee_id, first_name, salary, salary + 300 FROM employees;

-- 5) �����ȣ, �̸�, �޿�, ���ʽ�, �� �޿� ���
SELECT employee_id, first_name, salary,
       NVL(salary * commission_pct, 0) ���ʽ�,
       salary + NVL(salary * commission_pct, 0) "�� �޿�"
FROM employees;

-- 6) first_name�� �̸�, salary�� �޿��� ���
SELECT first_name �̸�, salary �޿� FROM employees;

-- 7) first_name�� name, salary * 12�� Annual Salary(����)���� ���
SELECT first_name name, salary * 12 "Annual Salary(����)" FROM employees;

-- 8) �̸��� ������ �����Ͽ� ���
SELECT first_name || ' ' || job_id FROM employees;

-- 9) �̸��� ������ ��KING is a PRESIDENT�� �������� ���
SELECT first_name || ' is a ' || job_id FROM employees;

-- 10) �̸��� ������ ��KIM : 1 Year Salary = 60000�� �������� ���
SELECT first_name || ' " 1 Year Salary = ' || (salary * 12) FROM employees;

-- 11) JOB�� �ߺ������ؼ� ��� ���
SELECT DISTINCT job_id FROM employees;