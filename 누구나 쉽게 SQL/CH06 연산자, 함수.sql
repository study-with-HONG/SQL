-- ��¥�� +, - ������ ���
SELECT seq_id, boarding_date+10 FROM subway_statistics;
SELECT seq_id, boarding_date-10 FROM subway_statistics;

-- 6-1 ���ڿ� ���� ������ / ||
SELECT '�ȳ�'||'�ϼ���' FROM dual; -- �ӽ����̺�

-- 6-2 �Ҽ��� �ݿø� / ROUND
SELECT ROUND(123.456, 1) A, ROUND(123.456, 2) B,
       ROUND(123.456, -1) C, ROUND(123.456, -2) D, ROUND(523.456, -3) E
FROM dual; -- 123.5 / 123.46 / 120 / 100 / 1000

-- 6-3 ���ڿ� �ڸ��� / SUBSTR
SELECT SUBSTR('ABCDEF', 1, 3) A, SUBSTR('ABCDEF', 0, 3) B,
       SUBSTR('ABCDEF', 1) C, SUBSTR('ABCDEF', -2) D,
       SUBSTR('ABCDEF', -2, 1) E, SUBSTR('ABCDEF', 2, -1) F
FROM dual; -- ABC / ABC / ABCDEF / EF / E / NULL

-- 6-4 ���ڿ����� ����ã�� / INSTR
SELECT INSTR( 'ABABAB', 'A' ) A ,INSTR( 'ABABAB', 'A', 2 ) B,
       INSTR( 'ABABAB', 'A', 2, 1 ) C, INSTR( 'ABABAB', 'A', 2, 2 ) D
FROM dual; -- 1 / 3 / 3 / 5

-- 6-5 ��¥ ��ȯ / TO_CHAR
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MM:SS')
FROM dual;

-- 6-6 ����� ����ȯ / TO_DATE
INSERT INTO subway_statistics
VALUES (100, 'ȫ��', TO_DATE('2020-10-10', 'YYYY-MM-DD'), '����', 7, 1500);

-- 6-7 NULL ���� �Լ�
SELECT NVL( NULL, 'N/A' ) A, NVL2( 1, 2, 3 ) B,
       COALESCE( NULL, NULL, 5) C, NULLIF( 'NULL', 'null' ) D
FROM dual;

-- ū ��, ���� �� ã�� / GREATEST, LEAST
SELECT GREATEST('a', 1, 2, 3) FROM dual; -- a
SELECT GREATEST(1, 'a', 'b') FROM dual; -- ���ڸ� ���ڷ� �ٲ� �� ���� ���� �߻�

SELECT LEAST('a', 1, 2, 3) FROM dual; -- 1
SELECT LEAST(1, 'a', 'b') FROM dual; -- ���ڸ� ���ڷ� �ٲ� �� ���� ���� �߻�

-- ù��° �Ű������� �� �� / DECODE
SELECT DECODE(1, 1, 'a', 2, 'b') FROM dual; -- a
SELECT DECODE(5, 1, 'a', 2, 'b') FROM dual; -- null

-- 6-8 �˻��� CASE ǥ����
SELECT seq_id, passenger_number,
    CASE WHEN passenger_number BETWEEN 0  AND 999 THEN '��������'
         WHEN passenger_number BETWEEN 1000 AND 1999 THEN '����'
         WHEN passenger_number BETWEEN 2000 AND 2999 THEN '����'
         WHEN passenger_number BETWEEN 3000 AND 3999 THEN '����'
         ELSE '���� ����'
    END �̿�����
FROM subway_statistics
WHERE station_name = '���￪';

SELECT last_name, job_id, salary,
    CASE WHEN salary BETWEEN 0  AND 4999 THEN '����'
         WHEN salary BETWEEN 5000 AND 9999 THEN '����'
         WHEN salary BETWEEN 10000 AND 14999 THEN '����'
         ELSE '���� ����'
    END ����
FROM employees
WHERE employee_id BETWEEN 100 AND 110;

-- �ܼ��� CASE ǥ����
SELECT employee_id, last_name, department_id,
    CASE department_id WHEN 50 THEN '�ؿ��'
                       WHEN 80 THEN '������'
                       WHEN 90 THEN '�ӿ�'
                       WHEN 110 THEN 'ȸ���'
         ELSE '��Ÿ�μ�'
    END �μ���
FROM employees
WHERE MOD(employee_id, 5)=0;