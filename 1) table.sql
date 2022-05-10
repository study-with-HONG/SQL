-- 테이블 생성
CREATE TABLE test01(
   col1 NUMBER,
   col2 VARCHAR2(10),
   col3 DATE
);

-- 테이블 복제 : 데이터 포함
CREATE TABLE copy_o AS
SELECT employee_id, first_name, salary FROM employees;

-- 테이블 복제 : 데이터 미포함, 컬럼명만 복제됨.
CREATE TABLE copy_x AS
SELECT * FROM employees WHERE 1 = 2; -- 성립되지 않는 조건을 작성

CREATE TABLE test02(num, name, money) AS -- 컬럼명 지정 가능
SELECT employee_id, first_name, salary FROM employees WHERE 1 = 2;

-- 테이블 명 수정
ALTER TABLE test02
RENAME TO test22;

-- 테이블 컬럼추가
ALTER TABLE test22
ADD email NUMBER;

-- 테이블 컬럼수정
ALTER TABLE test22
MODIFY email VARCHAR2(20);

-- 테이블 컬럼삭제
ALTER TABLE test22
DROP COLUMN email;