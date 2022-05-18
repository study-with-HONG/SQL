-- 날짜에 +, - 연산자 사용
SELECT seq_id, boarding_date+10 FROM subway_statistics;
SELECT seq_id, boarding_date-10 FROM subway_statistics;

-- 6-1 문자열 결합 연산자 / ||
SELECT '안녕'||'하세요' FROM dual; -- 임시테이블

-- 6-2 소수점 반올림 / ROUND
SELECT ROUND(123.456, 1) A, ROUND(123.456, 2) B,
       ROUND(123.456, -1) C, ROUND(123.456, -2) D, ROUND(523.456, -3) E
FROM dual; -- 123.5 / 123.46 / 120 / 100 / 1000

-- 6-3 문자열 자르기 / SUBSTR
SELECT SUBSTR('ABCDEF', 1, 3) A, SUBSTR('ABCDEF', 0, 3) B,
       SUBSTR('ABCDEF', 1) C, SUBSTR('ABCDEF', -2) D,
       SUBSTR('ABCDEF', -2, 1) E, SUBSTR('ABCDEF', 2, -1) F
FROM dual; -- ABC / ABC / ABCDEF / EF / E / NULL

-- 6-4 문자열에서 문자찾기 / INSTR
SELECT INSTR( 'ABABAB', 'A' ) A ,INSTR( 'ABABAB', 'A', 2 ) B,
       INSTR( 'ABABAB', 'A', 2, 1 ) C, INSTR( 'ABABAB', 'A', 2, 2 ) D
FROM dual; -- 1 / 3 / 3 / 5

-- 6-5 날짜 변환 / TO_CHAR
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MM:SS')
FROM dual;

-- 6-6 명시적 형변환 / TO_DATE
INSERT INTO subway_statistics
VALUES (100, '홍대', TO_DATE('2020-10-10', 'YYYY-MM-DD'), '승차', 7, 1500);

-- 6-7 NULL 관련 함수
SELECT NVL( NULL, 'N/A' ) A, NVL2( 1, 2, 3 ) B,
       COALESCE( NULL, NULL, 5) C, NULLIF( 'NULL', 'null' ) D
FROM dual;

-- 큰 값, 작은 값 찾기 / GREATEST, LEAST
SELECT GREATEST('a', 1, 2, 3) FROM dual; -- a
SELECT GREATEST(1, 'a', 'b') FROM dual; -- 문자를 숫자로 바꿀 수 없어 오류 발생

SELECT LEAST('a', 1, 2, 3) FROM dual; -- 1
SELECT LEAST(1, 'a', 'b') FROM dual; -- 문자를 숫자로 바꿀 수 없어 오류 발생

-- 첫번째 매개변수와 값 비교 / DECODE
SELECT DECODE(1, 1, 'a', 2, 'b') FROM dual; -- a
SELECT DECODE(5, 1, 'a', 2, 'b') FROM dual; -- null

-- 6-8 검색형 CASE 표현식
SELECT seq_id, passenger_number,
    CASE WHEN passenger_number BETWEEN 0  AND 999 THEN '아주적음'
         WHEN passenger_number BETWEEN 1000 AND 1999 THEN '적음'
         WHEN passenger_number BETWEEN 2000 AND 2999 THEN '보통'
         WHEN passenger_number BETWEEN 3000 AND 3999 THEN '많음'
         ELSE '아주 많음'
    END 이용정도
FROM subway_statistics
WHERE station_name = '서울역';

SELECT last_name, job_id, salary,
    CASE WHEN salary BETWEEN 0  AND 4999 THEN '적음'
         WHEN salary BETWEEN 5000 AND 9999 THEN '보통'
         WHEN salary BETWEEN 10000 AND 14999 THEN '많음'
         ELSE '아주 많음'
    END 월급
FROM employees
WHERE employee_id BETWEEN 100 AND 110;

-- 단순형 CASE 표현식
SELECT employee_id, last_name, department_id,
    CASE department_id WHEN 50 THEN '해운부'
                       WHEN 80 THEN '영업부'
                       WHEN 90 THEN '임원'
                       WHEN 110 THEN '회계부'
         ELSE '기타부서'
    END 부서명
FROM employees
WHERE MOD(employee_id, 5)=0;