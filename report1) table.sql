-- 문제1) EMPLOYEES 테이블에서 부서별 인원수,평균 급여,급여의 합,최소 급여,최대 급여를 포함하는
--       EMP_DEPTNO 테이블 생성
CREATE TABLE emp_deptno("인원수", "평균 급여", "급여의 합", "최소 급여", "최대 급여") AS
SELECT COUNT(*), AVG(salary), SUM(salary), MIN(salary), MAX(salary) FROM employees
WHERE 1=2;
 
-- 문제2) EMP_DEPTNO 테이블에 ETC 컬럼 추가, 자료형은 VARCHAR2(50)
ALTER TABLE emp_deptno
ADD etc VARCHAR2(50);

-- 문제3) EMP_DEPTNO 테이블 ETC 컬럼 자료형 VARCHAR2(15)로 수정
ALTER TABLE emp_deptno
MODIFY etc VARCHAR2(15);

-- 문제4) EMP_DEPTNO 테이블에 있는 ETC 삭제
ALTER TABLE emp_deptno
DROP COLUMN etc;

-- 문제5) EMP_DEPTNO 테이블의 이름을 EMP_DEPT로 변경
ALTER TABLE emp_deptno
RENAME TO emp_dept;

-- 문제6) EMP_DEPT 테이블을 삭제하라.
DROP TABLE emp_dept;