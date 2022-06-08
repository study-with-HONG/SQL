/*  DUAL : �������̺�, �ӽ����̺�  */
SELECT 1, 'A' FROM dual;

SELECT TO_DATE('20211222', 'YYYYMMDD') FROM dual;

/*  SUBSTR : ���ڿ� �ڸ���  */
SELECT SUBSTR('ABCDEFG', 2, 3) FROM dual; -- BCD

SELECT SUBSTR('ABCDEFG', 3) FROM dual; -- CDEFG

/*  ROWNUM : ���� �ű��  */
SELECT ROWNUM, salary, employee_id, first_name
FROM employees
WHERE ROWNUM <= 10;

-- ���� �ȵ�.
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 20 AND ROWNUM > 10;

/*  ROWNUM�� �̿��� ���� �ű��  */
SELECT RNUM, employee_id, first_name, salary
FROM (SELECT ROWNUM AS RNUM, employee_id, first_name, salary -- 2. ��ȣ �ű�� --> ROWNUM
      FROM (SELECT employee_id, first_name, salary -- 1. ����
            FROM employees
            ORDER BY salary DESC))
WHERE RNUM >= 11 AND RNUM <= 20; -- 3. ���� ����

/*  DECODE = if��  */
SELECT employee_id, first_name, phone_number,
       DECODE(SUBSTR(phone_number, 1, 3), '515', '����', '590', '�λ�', '650', '����') ������ȣ
FROM employees;

/*  CASE = switch��  */
SELECT employee_id, first_name, phone_number,
       CASE SUBSTR(phone_number, 1, 3)
        WHEN '515' THEN '����'
        WHEN '590' THEN '�λ�'
        WHEN '650' THEN '����'
        ELSE '��Ÿ'
       END
FROM employees;

SELECT employee_id, first_name, phone_number,
       CASE WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '����'
            WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '�λ�'
            WHEN SUBSTR(phone_number, 1, 3) = '650' THEN '����'
            ELSE '��Ÿ'
       END AS ������ȣ
FROM employees;