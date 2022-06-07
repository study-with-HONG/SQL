/*  ���̺� ������ ������ employees ���̺� ���  */
-- 1) last_name�� Kochhar�� ����� �޿����� ���� ����� �����ȣ, �̸�, ������, �޿�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE last_name = 'Kochhar');

-- 2) �޿��� ��� �޿����� ���� ����� �����ȣ, �̸�, ������, �޿�, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- 3) 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �μ�
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) FROM employees
                     WHERE department_id = 100);

-- 4) ������ �ּ� �޿��� �޴� ����� �����ȣ, �̸�, ����, �μ���ȣ�� �������� ����
SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, MIN(salary)
                          FROM employees
                          GROUP BY job_id)
ORDER BY job_id;

-- 5) ������ SA_MAN ����� �̸�, ����, �μ���, �ٹ����� FROM, WHERE�� �� �� �ۼ�
-- FROM ��
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM (SELECT * FROM employees WHERE job_id = 'SA_MAN') e,
     departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id;

-- WHERE ��
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND e.employee_id IN(SELECT employee_id FROM employees
                     WHERE job_id = 'SA_MAN');

-- 6) ���� ���� ���ϸ� ���� MANAGER�� �����ȣ
SELECT manager_id, COUNT(*)
FROM employees
GROUP BY manager_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees
                   GROUP BY manager_id);
                            
-- 7) ���� ���� ����� ���� �ִ� �μ� ��ȣ�� �����
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees
                   GROUP BY department_id);

-- 8) 123�� ����� ������ ����, 192�� ����� �޿����� ���� ����� �����ȣ, �̸�, ����, �޿�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 123)
    AND salary > (SELECT salary FROM employees WHERE employee_id = 192);

-- 9) �������� �ּұ޿��� �޴� ����� �����ȣ, �̸�, ����, �μ����� �������� �������� ����
SELECT e.job_id, e.employee_id, e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND (e.job_id, e.salary) IN(SELECT job_id, MIN(salary) FROM employees
                                GROUP BY job_id)
ORDER BY e.job_id DESC;

-- 10) 50�� �μ��� �����ϰ� �޿��� 50�� �μ��� �ּ� �޿����� ���� ����� �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id = 50)
    AND department_id != 50;

-- 11) 50�� �μ��� �����ϰ� �޿��� 50�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 50)
    AND department_id != 50;