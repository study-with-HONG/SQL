/*	��� employees ���̺� ���

	ORDER BY�� ����
    SELECT ~ FROM ~
    WHERE ~
    ORDER BY ~ asc(��������, ���� ����) / desc(��������)
*/
-- 1) �޿� �������� ����
SELECT employee_id, first_name, salary FROM employees
ORDER BY salary;

-- 2) �޿� �������� ����
SELECT employee_id, first_name, salary FROM employees
ORDER BY salary DESC;

-- 3) 1���� �Ի����� ��������, 2���� �޿� �������� ����
SELECT employee_id, first_name, hire_date, salary FROM employees
ORDER BY hire_date, salary DESC;

-- 4) 1���� ������ ��������, 2���� �޿� �������� ����
SELECT employee_id, first_name, job_id, salary FROM employees
ORDER BY job_id, salary DESC;

/*  NULLS : NULL ��ġ ����  */
-- 1) NULL ���� �տ� ����
SELECT employee_id, first_name, commission_pct FROM employees
ORDER BY commission_pct NULLS FIRST;

-- 2) NULL ���� �ڿ� ����
SELECT employee_id, first_name, commission_pct FROM employees
ORDER BY commission_pct NULLS LAST;

-- 3) 1���� ���ʽ� NULL�� �ڷ�, 2���� �޿� �������� ����
SELECT employee_id, first_name, commission_pct, salary FROM employees
ORDER BY commission_pct NULLS LAST, salary DESC;

/*
    GROUP BY : �׷�ȭ
    HAVING : �׷�ȭ �� ����
    WHERE : �׷�ȭ �� ����
*/
-- 1) �μ���ȣ �׷�ȭ �� �������� ����
SELECT department_id FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2) ������ �׷�ȭ �� �������� ����
SELECT job_id FROM employees
GROUP BY job_id
ORDER BY job_id;

/*  ��� �׷��Լ� : COUNT, SUM, AVG, MAX, MIN  */
-- 1) ������ �� �ο���
SELECT job_id, COUNT(*) �ο��� FROM employees
GROUP BY job_id;

-- 2) ������ �� �޿� ���
SELECT job_id, COUNT(*) �ο���,
       SUM(salary) �հ�, AVG(salary) ���,
       MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
GROUP BY job_id
ORDER BY job_id;

-- 3) ������ �� �޿��� ���� 100000 �̻��� �μ� �޿� ���
SELECT job_id, COUNT(*) �ο���,
       SUM(salary) �հ�, AVG(salary) ���,
       MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 100000;

-- 4) �޿��� 5000�̻��� ����� �������� �׷�ȭ�� �� �޿��� ���� 20000�� �ʰ��ϴ� �μ� ��ȸ
SELECT job_id, SUM(salary) �հ� FROM employees
WHERE salary >= 5000
GROUP BY job_id
HAVING SUM(salary) >= 20000;