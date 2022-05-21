-- 8-1 ���̺� ����
CREATE TABLE emp08(
    emp_id2 NUMBER PRIMARY KEY,
    emp_name2 VARCHAR2(100) NOT NULL,
    gender VARCHAR2(10),
    age NUMBER,
    hire_date DATE,
    etc VARCHAR2(300)
);

-- 8-2 ���� ������ �Է�
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (1, '��������', '��', 23, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (2, '�㳭����', '��', 33, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (3, '�踸��', '��', 43, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (4, '�����', '��', 35, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (5, '�Ż��Ӵ�', '��', 45, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

-- 8-3 �� ������ ��� ������ ��ȸ / UNION ALL, ������
SELECT * FROM emp03 -- ù ��° ������ �÷����� �������� ��ȸ
UNION ALL
SELECT * FROM emp08;

-- 8-4 �÷� ���� �ٸ� ��� / ORA-01789: ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender FROM emp08;

-- 8-5 ���������� �ٸ� ��� / ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender, '' FROM emp08;

-- 8-6 ���� ������ ����
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender, age FROM emp08
ORDER BY emp_id; -- ù��° ������ �÷����� ����ؾ� ��. ���ڵ� ����

-- *�� ����� ���� SELECT * FROM���� �����ְ� ORDER BY ���
SELECT *
FROM
    (SELECT * FROM emp03
    UNION ALL
    SELECT * FROM emp08)
ORDER BY emp_id;

-- 8-7 UNION ALL �ߺ�������, �ߺ� ��ȸ
SELECT emp_name FROM emp03
UNION ALL
SELECT emp_name2 FROM emp08
ORDER BY emp_name;

-- 8-8 UNION �ߺ�������, �ߺ� ����
SELECT emp_name FROM emp03
UNION
SELECT emp_name2 FROM emp08
ORDER BY emp_name;

-- 8-9 ���� �ٸ� �� UNION
SELECT emp_name, gender FROM emp03
UNION
SELECT emp_name2, gender FROM emp08
ORDER BY emp_name;

-- 8-10 ���� ������ ��ȸ / INTERSECT, ������
SELECT emp_name FROM emp03
INTERSECT
SELECT emp_name2 FROM emp08;

-- 8-11 ���� ������ ���� ��
SELECT emp_name, gender FROM emp03
INTERSECT
SELECT emp_name2, gender FROM emp08;

-- 8-12 ù ��° ���տ��� �ִ� ������ ��ȸ / MINUS, ������
SELECT emp_name FROM emp03
MINUS
SELECT emp_name2 FROM emp08
ORDER BY 1;

-- 8-13 MINUS ���̺� ���� �ٲٱ�
SELECT emp_name2 FROM emp08
MINUS
SELECT emp_name FROM emp03
ORDER BY 1;