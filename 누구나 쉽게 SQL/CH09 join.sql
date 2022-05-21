-- 9-1 조인 실습 테이블 생성
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
    use VARCHAR2(2) DEFAULT 'Y' -- 기본값
);

CREATE TABLE master_address(
    adrs_id NUMBER PRIMARY KEY,
    si VARCHAR2(50),
    gu VARCHAR2(50),
    etc  VARCHAR2(100)
);

-- 9-2 조인 실습 데이터 입력
INSERT INTO master_employee
VALUES(1, '김유신', '남성', 56, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO master_employee
VALUES(2, '신사임당', '여성', 34, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 2);
INSERT INTO master_employee
VALUES(3, '홍길동', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 3, 2);
INSERT INTO master_employee
VALUES(4, '강감찬', '남성', 23, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2, 3);
INSERT INTO master_employee
VALUES(5, '세종대왕', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 4, 4);

INSERT INTO master_department(dept_id, dept_name)
VALUES(1, '회계팀');
INSERT INTO master_department(dept_id, dept_name)
VALUES(2, '경영팀');
INSERT INTO master_department(dept_id, dept_name)
VALUES(3, '전산팀');
INSERT INTO master_department(dept_id, dept_name)
VALUES(4, '마케팅팀');

INSERT INTO master_address
VALUES(1, '서울특별시', '중구', '새문안로 12');
INSERT INTO master_address
VALUES(2, '서울특별시', '서대문구', '연희로 15길');
INSERT INTO master_address
VALUES(3, '서울특별시', '영등포구', '여의대로 99');
INSERT INTO master_address
VALUES(4, '서울특별시', '강남구', '테헤란로 33');

-- 9-4 내부 조인 : 컬럼 값이 같은 건만 조회
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id;

-- 9-5 ANSI 내부 조인
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e INNER JOIN master_department d
ON e.dept_id = d.dept_id;

-- 9-6 내부 조인에서 남성만 조회
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id AND e.gender='남성';

-- ANSI 문법
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e INNER JOIN master_department d
ON e.dept_id = d.dept_id
WHERE e.gender='남성';

-- 9-7 테이블 3개 내부 조인
SELECT e.emp_id, e.emp_name, e.gender, e.age,
       d.dept_name, d.use,
       a.si, a.gu, a.etc
FROM master_employee e, master_department d, master_address a
WHERE e.dept_id=d.dept_id AND e.adrs_id=a.adrs_id;

-- ANSI 문법
SELECT e.emp_id, e.emp_name, e.gender, e.age,
       d.dept_name, d.use,
       a.si, a.gu, a.etc
FROM master_employee e
INNER JOIN master_department d ON e.dept_id=d.dept_id
INNER JOIN master_address a ON e.adrs_id=a.adrs_id;

-- 9-8 데이터 추가
INSERT INTO master_employee
VALUES(6, '왕건', '남성', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);

-- 9-9 회원 기준 외부 조인 : 컬럼 값이 없는 데이터도 조회
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id = d.dept_id(+) -- 데이터가 없는 쪽에 (+)붙임.
ORDER BY e.emp_id;

-- 9-10 회원 기준 ANSI 외부 조인
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_id, d.dept_name, d.use
FROM master_employee e LEFT JOIN master_department d
ON e.dept_id = d.dept_id(+)
ORDER BY e.emp_id;

-- 9-11 데이터 추가
INSERT INTO master_department(dept_id, dept_name)
VALUES(5, 'IT팀');

-- 9-12 부서 기준 외부 조인
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
WHERE e.dept_id(+) = d.dept_id
ORDER BY e.emp_id;

-- ANSI 문법 부서 기준
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e RIGHT JOIN master_department d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- 9-13 FULL OUTER JOIN : join에 참여하는 데이터 모두 조회, ANSI만 가능
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e FULL JOIN master_department d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- 9-14 카티션 곱 : 조인 조건 생략 -> 모든 조합의 데이터 조회
SELECT e.emp_id, e.emp_name, e.gender, e.age, d.dept_name, d.use
FROM master_employee e, master_department d
ORDER BY e.emp_id;