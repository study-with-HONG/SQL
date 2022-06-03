/*  SUB QUERY : QUERY ���� QUERY
    
    ��� ��ġ�� ���� ���
    - SELECT  ����ROW ����COLUMN ��ȯ
    - FROM    ����ROW ����COLUMN ��ȯ
    - WHERE   ����ROW ����COLUMN ��ȯ
*/
/*  SELECT�� SUB QUERY  */
SELECT employee_id, first_name,
      (SELECT first_name FROM employees
       WHERE employee_id = 100) ��������
FROM employees;

SELECT employee_id, first_name,
      (SELECT COUNT(*) FROM employees) "��ü �����"
FROM employees;

-- �������� ����� ���� ���̶� ����
SELECT employee_id, first_name,
      (SELECT first_name FROM employees
       WHERE salary > 10000)
FROM employees;

-- �������� ����� ���� �÷��̶� ����
SELECT employee_id, first_name,
      (SELECT first_name, salary FROM employees
       WHERE employee_id = 100)
FROM employees;

/*  FROM�� SUB QUERY  */
-- �μ���ȣ�� 80�� ��� �� �޿� 10000 �̻�
SELECT employee_id, first_name, salary, department_id
FROM (SELECT *
      FROM employees
      WHERE department_id = 80)
WHERE salary >= 10000;

-- �μ���ȣ�� 50�� ��� �� �޿� 6000 �̻�
SELECT employee_id, salary, department_id
FROM (SELECT * FROM employees
      WHERE department_id = 50)
WHERE salary >= 6000;

-- �������� ��� ���ϴ� ���
SELECT employee_id, salary, department_id FROM employees
WHERE department_id = 50 AND salary >= 6000;

-- �޿�, ������, ���� �� �޿��� �հ� �ο���
SELECT e.employee_id, e.salary, e.job_id, sq."�޿� �հ�", sq.�ο���
FROM employees e,
    (SELECT SUM(salary) "�޿� �հ�", COUNT(*) �ο���, job_id
     FROM employees
     GROUP BY job_id) sq
WHERE e.job_id = sq.job_id;

/*  WHERE�� SUB QUERY  */
-- ��ձ޿����� ���� �޴� ���
SELECT employee_id, first_name, salary
FROM employees
WHERE (SELECT AVG(salary) FROM employees) < salary;

-- �μ����� �޿��� ���� ���� �޴� ���
SELECT department_id, first_name, salary FROM employees
WHERE (department_id, salary)
    IN(SELECT department_id, MAX(salary)
       FROM employees
       GROUP BY department_id)
ORDER BY department_id;