-- 1) employees 테이블을 복제해 emp_deptno 테이블 생성(컬럼 : 부서별 인원수, 평균 급여, 급여의 합, 최소 급여, 최대 급여)
CREATE TABLE emp_deptno("부서번호", "인원수", "평균 급여", "급여의 합", "최소 급여", "최대 급여")
AS SELECT department_id, COUNT(*), ROUND(AVG(salary)), SUM(salary),
          MIN(salary), MAX(salary)
   FROM employees
   GROUP BY department_id;

-- 2) emp_deptno 테이블에 자료형이 VARCHAR2(50)인 etc 컬럼 추가
ALTER TABLE emp_deptno
ADD etc VARCHAR2(50);

-- 3) emp_deptno 테이블에서 etc의 자료형을 VARCHAR2(15)로 수정
ALTER TABLE emp_deptno
MODIFY etc VARCHAR2(15);

-- 4) emp_deptno 테이블에서 etc 삭제
ALTER TABLE emp_deptno
DROP COLUMN etc;

-- 5) emp_deptno 테이블 이름을 emp_dept로 변경
ALTER TABLE emp_deptno
RENAME TO emp_dept;

-- 6) emp_dept 테이블 삭제
DROP TABLE emp_dept;