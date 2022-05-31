/*  ��� ������ employees ���̺� ���  */
-- 1) �޿��� 3000�̻��� ����� �����ȣ, �̸�, ������, �޿�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 3000;

-- 2) ������ ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';

-- 3) 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date >= TO_DATE('20060101', 'YYYYMMDD');

-- 4) �޿��� 3000 ~ 5000�� ����� ����, ������, �޿�, �μ���ȣ
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

-- 5) �����ȣ�� 145,152,203�� ����� �����ȣ, ����, ������, �޿�, �Ի�����
SELECT employee_id, first_name, job_id, salary, hire_date
FROM employees
WHERE employee_id IN(145, 142, 203);

-- 6) 2005�⵵�� �Ի��� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date LIKE '2005%';

-- 7) ���ʽ��� ���� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE commission_pct IS NULL;

-- 8) �޿��� 1100�̻��̰�, ������ ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 1100 AND job_id = 'ST_MAN';

-- 9) �޿��� 10000�̻��̰ų� ������ ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 10000 OR job_id = 'ST_MAN';

-- 10) ������ ST_MAN, SA_MAN, SA_REP�� �ƴ� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE job_id NOT IN('ST_MAN', 'SA_MAN', 'SA_REP');

-- 11) ������ PRES�̰� �޿��� 12000�̻��̰ų� ������ SA_MAN�� ����� �����ȣ, �̸�, ����, �޿�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id LIKE '%PRES%' AND salary >= 12000 OR job_id = 'SA_MAN';

-- 12) ������ AD_PRES �Ǵ� SA_MAN�̰�, �޿��� 12000�̻��� ����� �����ȣ, �̸�, ����, �޿�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id IN('AD_PRES', 'SA_MAN') AND salary >= 12000;