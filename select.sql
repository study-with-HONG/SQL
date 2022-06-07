/*  접속 계정에 있는 모든 테이블 조회  */
SELECT * FROM TAB;

/*  테이블에 있는 모든 데이터 조회  */
SELECT * FROM employees;

/*  테이블에 있는 모든 컬럼 조회  */
DESC employees;

/*  컬럼 연산  */
SELECT last_name, salary, salary+500 FROM employees;

SELECT last_name, salary, salary*12 FROM employees;

SELECT first_name || ' ' || salary FROM employees; -- 이클립스에서는 ;지워야 작동

/*  ALIAS : 컬럼 별명, 생략 가능  */
SELECT employee_id AS 사원번호, salary 월급 FROM employees;

/*  DISTINCT : 중복행 삭제  */
SELECT DISTINCT job_id FROM employees;

/*  DUAL : 가상테이블, 임시테이블  */
SELECT 1, 'A' FROM DUAL;

SELECT 'A' FROM DUAL;

SELECT TO_DATE('20211222', 'YYYYMMDD') FROM DUAL;
