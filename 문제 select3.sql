/*  ���̺� ������ ������ employees ���̺� ���  */
/*  ���� ����  */
-- 1) �Ի����� ������ �����ȣ, �̸�, ����, �޿�, �Ի�����, �μ���ȣ ��ȸ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
ORDER BY hire_date;

-- 2) ���� �ֱٿ� �Ի��� ������ �����ȣ, �̸�, ����, �޿�, �Ի�����, �μ���ȣ ��ȸ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
ORDER BY hire_date DESC;

-- 3) 1���� �μ���ȣ, 2���� �޿��� ���� ������ �����ȣ, ����, ����, �μ���ȣ, �޿� ��ȸ
SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- 4) 1���� �μ���ȣ, 2���� ����, 3���� �޿��� ���� ������ �����ȣ, ����, �Ի�����, �μ���ȣ, ����, �޿� ��ȸ
SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM employees
ORDER BY department_id, job_id, salary DESC;

/*  �׷�ȭ ����  */
-- 1) ��� �Ǹſ�(SA)�� �޿� ���
SELECT SUM(salary) �հ�, AVG(salary) ���, MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
WHERE job_id LIKE 'SA%';

-- 2) ���̺� �ִ� �� �ο�, ���ʽ��� �޴� �ο�, ��� ���ʽ�, ��ϵǾ� �ִ� �μ��� �� ��ȸ
SELECT COUNT(*) "�� �ο�", COUNT(commission_pct) "���ʽ� �޴� �ο�",
       ROUND(AVG(salary * commission_pct)) "��� ���ʽ�",
       COUNT(DISTINCT department_id) "�� �μ� ��"
FROM employees;

-- 3) �μ��� �ο��� �� �޿� ���
SELECT department_id, COUNT(*) �ο���,
       SUM(salary) �հ�, ROUND(AVG(salary)) ���,
       MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
GROUP BY department_id;

-- 4) �μ��� �ο��� �� �޿� ��踦 ���� �� �޿��� ���� ���� ������ ��ȸ
SELECT department_id, COUNT(*) �ο���,
       SUM(salary) �հ�, ROUND(AVG(salary)) ���,
       MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
GROUP BY department_id
ORDER BY �հ� DESC; -- ��Ī ��� ����

-- 5) �μ��� ������ �׷�ȭ �� �μ���ȣ, ����, �ο���, ��� �޿�, �޿��� �� ��ȸ
SELECT department_id, job_id, COUNT(*) �ο���, ROUND(AVG(salary)) ���, SUM(salary) �հ�
FROM employees
GROUP BY department_id, job_id;

-- 6) �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� �� ��ȸ
SELECT department_id, COUNT(*) �ο���, SUM(salary) �հ�
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 4;

-- 7) �ִ� �޿��� 10000�̻��� �μ��� �μ���ȣ, ��� �޿�, �޿��� �� ��ȸ
SELECT department_id, MAX(salary) �ִ�޿�, ROUND(AVG(salary)) ���, SUM(salary) �հ�
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

-- 8) ��� �޿��� 10000 �̻��� ������ �̸�, ��� �޿�, �޿��� �� ��ȸ
SELECT job_id, ROUND(AVG(salary)) ���, SUM(salary) �հ�
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 10000;

-- 9) ��ü ������ 10000�� �ʰ��ϴ� ������ �޿��� �� ��ȸ, �� �Ǹſ�(SA)�� �����ϰ� �޿� �հ�� �������� ����
SELECT job_id, SUM(salary) �հ�
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary) DESC;

/*  ǥ���Լ� ����  */
-- 1) last_name���� King�� �빮�ڷ� �˻� �� �����ȣ, ����, ������, �μ���ȣ ��ȸ / UPPER
SELECT employee_id, last_name, first_name, job_id, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

-- 2) departments ���̺��� �μ���ȣ�� �μ��̸��� �����ؼ� ��ȸ / CONCAT
SELECT CONCAT(department_id, department_name)
FROM departments;

-- 3) first_name���� ��e�� ��ġ ã�� / INSTR
SELECT first_name, INSTR(first_name,'e')
FROM employees;

-- 4) first_name���� �ι�° ��e�� ��ġ ã�� / INSTR
SELECT first_name, INSTR(first_name,'e', 1, 2)
FROM employees;

-- 5) �μ���ȣ�� 80�� ����� �޿��� 30���� ���� ������ ��� / MOD
SELECT department_id, first_name, salary, MOD(salary, 30)
FROM employees
WHERE department_id = 80;

-- 6) �ٹ� �ϼ��� ���� ������ ������� �ٹ��� ���� �� �� ��ĥ ���� ��� / SYSDATE, TRUNC
SELECT first_name, hire_date, TRUNC(SYSDATE - hire_date) ��, TRUNC((SYSDATE - hire_date)/7) ��
FROM employees
ORDER BY hire_date;

-- 7) �μ���ȣ�� 50�� �μ��� �޿� �տ� $�� �����ϰ� 3�ڸ����� , ��� / TO_CHAR
SELECT first_name, TO_CHAR(salary, '$9,999,999') �޿�
FROM employees
WHERE department_id = 50;
