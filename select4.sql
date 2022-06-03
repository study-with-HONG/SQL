/*  JOIN
    - �� �� �̻��� ���̺��� �����ؼ� �����͸� �˻��ϴ� ���, �⺻Ű�� �ܷ�Ű ���
    
    JOIN�� ����               �߿䵵
    - INNER, SELF            *****
    - OUTER(LEFT, RIGHT)     ***
    - FULL OUTER             *
    - CROSS, ANTI ��
*/
/*  INNER JOIN : ���� ���̺��� �������� �����ϴ� ������, ������  */
-- ansi SQL ����
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

-- oracle ����
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 1) �����ȣ�� 200�� ����� �μ��� ��ȸ
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.employee_id = 200;

-- 2) ������ ���� Ÿ��Ʋ ��ȸ
SELECT DISTINCT e.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY e.job_id;

/*  SELF JOIN : ������ ���̺� JOIN  */
-- ����� �̸� ��ȸ
SELECT a.employee_id ���ϻ��, a.first_name �����̸�,
       a.manager_id �����, b.first_name ����̸�
FROM employees a, employees b -- a�� ���� ���̺�, b�� ��� ���̺�
WHERE a.manager_id = b.employee_id
ORDER BY a.employee_id;

/*  LEFT OUTER JOIN : INNER + ���� ���̺��� �����ϴ� ������  */
-- ansi SQL ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d -- employees�� �߽� ���̺�
ON e.department_id = d.department_id;

-- oracle ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d -- employees�� �߽� ���̺�
WHERE e.department_id = d.department_id(+);

/*  LEFT OUTER - INNER : ������  */
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) AND e.department_id IS NULL;

/*  RIGHT OUTER JOIN : INNER + ������ ���̺��� �����ϴ� ������  */
-- ansi SQL ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d -- departments�� �߽� ���̺�
ON e.department_id = d.department_id;

-- oracle ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d -- departments�� �߽� ���̺�
WHERE e.department_id(+) = d.department_id;

/*  FULL OUTER JOIN : ��� ������, ������  */
-- ansi SQL ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- oracle ����
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
UNION
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
    
/*  FULL OUTER - INNER : ��Ī ������  */
-- ansi SQL ����(oracle�� ����)
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departmentS d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;

/*  CROSS JOIN : ��� ������ ���� ���, ���� ���� X  */
-- ansi SQL ����
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e CROSS JOIN departments d;

-- oracle ����
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d;