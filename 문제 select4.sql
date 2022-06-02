-- 1) �̸�, �μ���ȣ, �μ��� ��ȸ
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 2) �μ���ȣ�� 30���� ����� �̸�, ����, ���� Ÿ��Ʋ, �μ���
SELECT e.employee_id, e.first_name, e.job_id, j.job_title, d.department_name
FROM employees e, jobs j, departments d
WHERE e.job_id = j.job_id AND e.department_id = d.department_id
    AND e.department_id = 30;

-- 3) ���ʽ� �޴� ����� �̸�, ����, �μ���ȣ, �μ���
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

-- 4) ������ȣ 2500���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ���, ������
SELECT e.employee_id, e.first_name, e.job_id,
       e.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND l.location_id = 2500;

-- 5) �̸��� A�� ���� ����� �̸��� �μ���
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.first_name LIKE '%a%'
ORDER BY e.first_name;

-- 6) ����̸��� �� ����� ������ �̸� ��ȸ
SELECT a.first_name ���, b.first_name ������
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- 7) �޿��� 3000 �̻��� ����� �̸�, �μ���, �޿�
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.salary >= 3000;

-- 8) TJ(first_name)���� �ʰ� �Ի��� ����� �̸��� �Ի���
SELECT b.first_name , b.hire_date
FROM employees a, employees b
WHERE a.first_name = 'TJ' AND a.hire_date < b.hire_date
ORDER BY b.hire_date;

-- 9) �޿��� 3000 ~ 5000�� ����� �̸��� �μ���
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.salary BETWEEN 3000 AND 5000;

-- 10) ACCOUNTING �Ҽ� ����� �̸��� �Ի���
SELECT e.employee_id, e.first_name, e.hire_date, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND UPPER(d.department_name) = 'ACCOUNTING';

-- 11) �޿��� 3000������ ����� �̸�, �޿�, �ٹ���
SELECT e.first_name, e.salary, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND e.salary <= 3000;