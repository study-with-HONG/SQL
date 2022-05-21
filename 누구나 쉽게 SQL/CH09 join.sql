-- 9-1 ���� �ǽ� ���̺� ����
CREATE TABLE master_employee(
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(10),
    age NUMBER,
    hire_date DATE,
    dept_id NUMBER,
    adrs_id NUMBER
);

CREATE TABLE master_department(
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50),
    dept_memo VARCHAR2(100),
    use VARCHAR2(2) DEFAULT 'Y' -- �⺻��
);

CREATE TABLE master_address(
    adrs_id NUMBER PRIMARY KEY,
    si VARCHAR2(50),
    gu VARCHAR2(50),
    etc  VARCHAR2(100)
);

-- 9-2 ���� �ǽ� ������ �Է�
INSERT INTO master_employee
VALUES(1, '������', '����', 56, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO master_employee
VALUES(2, '�Ż��Ӵ�', '����', 34, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 2);
INSERT INTO master_employee
VALUES(3, 'ȫ�浿', '����', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 3, 2);
INSERT INTO master_employee
VALUES(4, '������', '����', 23, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2, 3);
INSERT INTO master_employee
VALUES(5, '�������', '����', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 4, 4);

INSERT INTO master_department(dept_id, dept_name)
VALUES(1, 'ȸ����');
INSERT INTO master_department(dept_id, dept_name)
VALUES(2, '�濵��');
INSERT INTO master_department(dept_id, dept_name)
VALUES(3, '������');
INSERT INTO master_department(dept_id, dept_name)
VALUES(4, '��������');

INSERT INTO master_address
VALUES(1, '����Ư����', '�߱�', '�����ȷ� 12');
INSERT INTO master_address
VALUES(2, '����Ư����', '���빮��', '����� 15��');
INSERT INTO master_address
VALUES(3, '����Ư����', '��������', '���Ǵ�� 99');
INSERT INTO master_address
VALUES(4, '����Ư����', '������', '������� 33');

-- 9-4 ���� ���� : �÷� ���� ���� �Ǹ� ��ȸ
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id;

-- 9-5 ANSI ���� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e INNER JOIN master_department d
ON e.dept_id = d.dept_id;

-- 9-6 ���� ���ο��� ������ ��ȸ
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id AND e.gender='����';

-- ANSI ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e INNER JOIN master_department d
ON e.dept_id = d.dept_id
WHERE e.gender='����';

-- 9-7 ���̺� 3�� ���� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age,
       d.dept_name, d.use,
       a.si, a.gu, a.etc
FROM master_employee e, master_department d, master_address a
WHERE e.dept_id=d.dept_id AND e.adrs_id=a.adrs_id;

-- ANSI ����
SELECT e.emp_id, e.emp_name, e.gender, e.age,
       d.dept_name, d.use,
       a.si, a.gu, a.etc
FROM master_employee e
INNER JOIN master_department d ON e.dept_id=d.dept_id
INNER JOIN master_address a ON e.adrs_id=a.adrs_id;

-- 9-8 ������ �߰�
INSERT INTO master_employee
VALUES(6, '�հ�', '����', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);

-- 9-9 ȸ�� ���� �ܺ� ���� : �÷� ���� ���� �����͵� ��ȸ
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id(+) -- �����Ͱ� ���� �ʿ� (+)����.
ORDER BY e.emp_id;

-- 9-10 ȸ�� ���� ANSI �ܺ� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_id, d.dept_name, d.use
FROM master_employee e LEFT JOIN master_department d
ON e.dept_id = d.dept_id(+)
ORDER BY e.emp_id;

-- 9-11 ������ �߰�
INSERT INTO master_department(dept_id, dept_name)
VALUES(5, 'IT��');

-- 9-12 �μ� ���� �ܺ� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id(+) = d.dept_id
ORDER BY e.emp_id;

-- ANSI ���� �μ� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e RIGHT JOIN master_department d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- 9-13 FULL OUTER JOIN : join�� �����ϴ� ������ ��� ��ȸ, ANSI�� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e FULL JOIN master_department d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- 9-14 īƼ�� �� : ���� ���� ���� -> ��� ������ ������ ��ȸ
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
ORDER BY e.emp_id;