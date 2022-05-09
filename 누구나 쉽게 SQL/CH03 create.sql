-- 3-1 테이블 생성
CREATE TABLE emp03 (
   emp_id NUMBER NOT NULL PRIMARY KEY,
   emp_name VARCHAR2(100) NOT NULL,
   gender VARCHAR2(10),
   age NUMBER,
   hire_date DATE,
   etc VARCHAR2(300)
);

-- 3-2 테이블 조회
SELECT * FROM emp03;
