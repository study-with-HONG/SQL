/*  ��� employees ���̺� ���

    WHERE�� ����
    SELECT ~ FROM ~
    WHERE ~         -> ������ if
    
    - �񱳿�����(>, <, >=, <=, !=, =, <>)
    - NULL, IS NULL, IS NOT NULL
    - AND -> &&, OR -> ||, ()  */
/*  �񱳿�����  */
-- ���� 1) first_name�� Julia
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = 'Julia';

-- ���� 2) �޿� 9000�̻�
SELECT employee_id, first_name, salary FROM employees
WHERE salary >= 9000;

-- ���� 3) first_name�� Shanta���� ��
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name > 'Shanta';

-- ���� 4) first_name ù ���ڰ� J���� ��
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name > 'J';

-- ���� 5) 2007/12/31 ���Ŀ� �Ի�
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date > TO_DATE('20071231', 'YYYYMMDD');

/*  NULL, NOT NULL  */
-- ���� 1) �Ŵ���(���)X
SELECT employee_id, first_name, manager_id FROM employees
WHERE manager_id IS NULL;

-- ���� 2) commission_pct(���ʽ�) O
SELECT employee_id, first_name, commission_pct FROM employees
WHERE commission_pct IS NOT NULL;

/*  AND  */
-- ���� 1) first_name�� Shanta, last_name�� Vollman
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = 'Shanta' AND last_name = 'Vollman';

-- ���� 2) first_name�� John, �޿� 5000 �̻�
SELECT employee_id, first_name, salary FROM employees
WHERE first_name = 'John' AND salary > 5000;

-- ���� 3) 2006�⵵�� �Ի�
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date >= TO_DATE('20060101', 'YYYYMMDD')
    AND hire_date <= TO_DATE('20061231', 'YYYYMMDD');

/*  ALL(=AND), ANY(=OR)  */
-- ���� 1) first_name�� Julia�鼭 John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = ALL('Julia', 'John'); -- �� �� ������ �� ���⿡ ��� X

-- ���� 2) first_name�� Julia�̰ų� John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = ANY('Julia', 'John');

-- ���� 3) �޿��� 3200, 6000, 8000
SELECT employee_id, first_name, salary FROM employees
WHERE salary = ANY(8000, 3200, 6000);

/*  IN(ANY���� ���� ���), NOT IN  */
-- ���� 1) �޿��� 3200, 6000, 8000
SELECT employee_id, first_name, salary FROM employees
WHERE salary IN(3200, 6000, 8000);

-- ���� 2) �޿��� 3200, 6000, 8000 �̿�
SELECT employee_id, first_name, salary FROM employees
WHERE salary NOT IN(3200, 6000, 8000);

-- ���� 3) first_name�� Julia�̰ų� John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name IN('Julia', 'John');

-- ���� 4) commission_pct(���ʽ�) X
SELECT employee_id, first_name, commission_pct FROM employees
WHERE commission_pct IS NULL;

/*  BETWEEN : ���� ������  */
-- ���� 1) �޿� 3200 ~ 9000
SELECT employee_id, first_name, salary FROM employees
--WHERE salary >= 3200 AND salary <= 9000;
WHERE salary BETWEEN 3200 AND 9000; -- ������ ����

-- ���� 2) �޿� 3200 �̸�, 9000 �ʰ�
SELECT employee_id, first_name, salary FROM employees
WHERE salary NOT BETWEEN 3200 AND 9000;

/*  !=, <> ���� ���� ���  */
-- ���� 1) �޿��� 7000
SELECT employee_id, first_name, salary FROM employees
WHERE salary = 7000;

-- ���� 2) �޿��� 7000 �̿�
SELECT employee_id, first_name, salary FROM employees
WHERE salary != 7000;

SELECT employee_id, first_name, salary FROM employees
WHERE salary <> 7000;

/*  LIKE  */
-- ���� 1) first_name�� G_ra_d
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _�� �ѱ��ڸ� �ǹ�

-- ���� 2) K�� �����ϰ� y�� ������ first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'K%y'; -- %�� ���ڼ� ��� ���

-- ���� 3) A�� �����ϴ� first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'A%';

-- ���� 4) �߰��� E�� ���� first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE '%e%';

-- ���� 5) y�� ������ first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE '%y';

-- ���� 6) 2005�⵵�� �Ի�
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date LIKE '2005%';

-- ���� 7) ����ȣ�� 590���� �����ϰ� �޿� 5000 �̻�
SELECT employee_id, first_name, phone_number, salary FROM employees
WHERE phone_number LIKE '590%' AND salary >= 5000;