-- 8-1 테이블 생성
CREATE TABLE emp08(
    emp_id2 NUMBER PRIMARY KEY,
    emp_name2 VARCHAR2(100) NOT NULL,
    gender VARCHAR2(10),
    age NUMBER,
    hire_date DATE,
    etc VARCHAR2(300)
);

-- 8-2 직원 데이터 입력
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (1, '선덕여왕', '여', 23, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (2, '허난설헌', '여', 33, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (3, '김만덕', '여', 43, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (4, '장희빈', '여', 35, TO_DATE('2018-02-01', 'YYYY-MM-DD'));
INSERT INTO emp08(emp_id2, emp_name2, gender, age, hire_date)
VALUES (5, '신사임당', '여', 45, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

-- 8-3 두 집합의 모든 데이터 조회 / UNION ALL, 합집합
SELECT * FROM emp03 -- 첫 번째 문장의 컬럼명을 기준으로 조회
UNION ALL
SELECT * FROM emp08;

-- 8-4 컬럼 수가 다른 경우 / ORA-01789: 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender FROM emp08;

-- 8-5 데이터형이 다른 경우 / ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender, '' FROM emp08;

-- 8-6 집합 데이터 정렬
SELECT emp_id, emp_name, gender, age FROM emp03
UNION ALL
SELECT emp_id2, emp_name2, gender, age FROM emp08
ORDER BY emp_id; -- 첫번째 문장의 컬럼명을 사용해야 함. 숫자도 가능

-- *를 사용할 때는 SELECT * FROM으로 묶어주고 ORDER BY 사용
SELECT *
FROM
    (SELECT * FROM emp03
    UNION ALL
    SELECT * FROM emp08)
ORDER BY emp_id;

-- 8-7 UNION ALL 중복데이터, 중복 조회
SELECT emp_name FROM emp03
UNION ALL
SELECT emp_name2 FROM emp08
ORDER BY emp_name;

-- 8-8 UNION 중복데이터, 중복 없음
SELECT emp_name FROM emp03
UNION
SELECT emp_name2 FROM emp08
ORDER BY emp_name;

-- 8-9 값이 다를 때 UNION
SELECT emp_name, gender FROM emp03
UNION
SELECT emp_name2, gender FROM emp08
ORDER BY emp_name;

-- 8-10 공통 데이터 조회 / INTERSECT, 교집합
SELECT emp_name FROM emp03
INTERSECT
SELECT emp_name2 FROM emp08;

-- 8-11 공통 데이터 없을 때
SELECT emp_name, gender FROM emp03
INTERSECT
SELECT emp_name2, gender FROM emp08;

-- 8-12 첫 번째 집합에만 있는 데이터 조회 / MINUS, 차집합
SELECT emp_name FROM emp03
MINUS
SELECT emp_name2 FROM emp08
ORDER BY 1;

-- 8-13 MINUS 테이블 순서 바꾸기
SELECT emp_name2 FROM emp08
MINUS
SELECT emp_name FROM emp03
ORDER BY 1;