/*  DUAL : 가상테이블, 임시테이블  */
SELECT 1, 'A' FROM dual;

SELECT TO_DATE('20211222', 'YYYYMMDD') FROM dual;

/*  SUBSTR : 문자열 자르기  */
SELECT SUBSTR('ABCDEFG', 2, 3) FROM dual; -- BCD

SELECT SUBSTR('ABCDEFG', 3) FROM dual; -- CDEFG

/*  ROWNUM : 순번 매기기  */
SELECT ROWNUM, salary, employee_id, first_name
FROM employees
WHERE ROWNUM <= 10;

-- 실행 안됨.
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 20 AND ROWNUM > 10;

/*  ROWNUM을 이용해 순위 매기기  */
SELECT RNUM, employee_id, first_name, salary
FROM (SELECT ROWNUM AS RNUM, employee_id, first_name, salary -- 2. 번호 매기기 --> ROWNUM
      FROM (SELECT employee_id, first_name, salary -- 1. 정렬
            FROM employees
            ORDER BY salary DESC))
WHERE RNUM >= 11 AND RNUM <= 20; -- 3. 범위 지정

/*  DECODE = if문  */
SELECT employee_id, first_name, phone_number,
       DECODE(SUBSTR(phone_number, 1, 3), '515', '서울', '590', '부산', '650', '광주') 지역번호
FROM employees;

/*  CASE = switch문  */
SELECT employee_id, first_name, phone_number,
       CASE SUBSTR(phone_number, 1, 3)
        WHEN '515' THEN '서울'
        WHEN '590' THEN '부산'
        WHEN '650' THEN '광주'
        ELSE '기타'
       END
FROM employees;

SELECT employee_id, first_name, phone_number,
       CASE WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'
            WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
            WHEN SUBSTR(phone_number, 1, 3) = '650' THEN '광주'
            ELSE '기타'
       END AS 지역번호
FROM employees;