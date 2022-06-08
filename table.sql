/*
    Table : 기본적인 저장 단위 / row(행), column(열)
    
    table - object(create, drop, alter)
    data - insert, delete, select, update
*/
/*  CREATE TABLE ~ : 테이블 생성  */
CREATE TABLE create_test(
   col1 NUMBER,
   col2 VARCHAR2(10),
   col3 DATE
);

/*  테이블 복제 : 데이터 포함  */
CREATE TABLE copy_o
AS SELECT employee_id, first_name, salary FROM employees;

/*  테이블 복제 : 데이터 미포함, 컬럼명만 복제  */
CREATE TABLE copy_x
AS SELECT * FROM employees
   WHERE 1 = 2; -- 성립되지 않는 조건 작성

CREATE TABLE copyalias(num, name, money) -- 컬럼명 지정
AS SELECT employee_id, first_name, salary FROM employees
   WHERE 1 = 2;

/*  ALTER TABLE ~ RENAME TO ~ : 테이블 명 수정  */
ALTER TABLE copyalias
RENAME TO copyas;

/*  ALTER TABLE ~ ADD ~ : 테이블 컬럼추가  */
ALTER TABLE copyas
ADD email NUMBER;

/*  ALTER TABL ~ MODIFY ~ : 테이블 컬럼수정  */
ALTER TABLE copyas
MODIFY email VARCHAR2(20);

/*  ALTER TABL ~ DROP COLUMN ~ : 테이블 컬럼삭제  */
ALTER TABLE copyas
DROP COLUMN email;

/*  DROP TABLE ~ : 테이블 삭제*/
DROP TABLE create_test;

/*  휴지통 비우기  */
PURGE RECYCLEBIN;

/*  INSERT 실습용 테이블 생성  */
CREATE TABLE deft(부서번호, 부서명, 매니저번호, 지역번호)
AS SELECT department_id, department_name, manager_id, location_id
   FROM departments
   WHERE 1=2;

/*  INSERT INTO ~ VALUES ~ : 데이터 추가  */
INSERT INTO deft(부서번호, 부서명, 매니저번호, 지역번호)
VALUES(10, '기획부', 100, 123);

INSERT INTO deft(부서번호, 부서명)
VALUES(20, '관리부');

INSERT INTO deft -- 모든 컬럼을 추가하면 컬럼명 삭제 가능
VALUES(30, 'IT부', 333, 234);

INSERT INTO deft -- 컬럼수가 부족하면 컬럼명 삭제 불가
VALUES(30, 'IT부', 333);

INSERT INTO deft(부서명, 부서번호, 매니저번호, 지역번호)
VALUES('경리부', 40, 200, 345);

INSERT INTO deft(부서번호, 부서명, 매니저번호, 지역번호)
VALUES('50', '영업부', '400', '678'); -- 자동 형변환

INSERT INTO deft(부서번호, 부서명, 매니저번호, 지역번호)
VALUES(60, 100, 600, 645); -- 자동 형변환

/*  DELETE FROM ~ [WHERE ~] : 데이터 삭제  */
-- 조건에 부합하는 데이터 삭제
DELETE FROM deft
WHERE 부서번호 = '100';

DELETE FROM deft
WHERE 지역번호 IS NULL;

-- 조건이 없으면 모든 데이터 삭제
DELETE FROM deft;

/*  UPDATE ~ SET ~ [WHERE ~] : 데이터 수정  */
-- 조건에 부합하는 데이터 수정
UPDATE deft
SET 지역번호 = 300 WHERE 부서번호 = 30;

UPDATE deft
SET 부서번호 = 70, 지역번호 = 700 WHERE 부서명 = '영업부';

-- 조건이 없으면 모든 데이터 수정
UPDATE deft
SET 지역번호 = 02;