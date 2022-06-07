/*  SUB QUERY : QUERY 안의 QUERY
    
    사용 위치에 따른 결과
    - SELECT  단일ROW 단일COLUMN 반환
    - FROM    다중ROW 다중COLUMN 반환
    - WHERE   다중ROW 다중COLUMN 반환
*/
/*  SELECT절 SUB QUERY  */
SELECT employee_id, first_name,
      (SELECT first_name FROM employees
       WHERE employee_id = 100) 서브쿼리
FROM employees;

SELECT employee_id, first_name,
      (SELECT COUNT(*) FROM employees) "전체 사원수"
FROM employees;

-- 서브쿼리 결과가 다중 행이라 실패
SELECT employee_id, first_name,
      (SELECT first_name FROM employees
       WHERE salary > 10000)
FROM employees;

-- 서브쿼리 결과가 다중 컬럼이라 실패
SELECT employee_id, first_name,
      (SELECT first_name, salary FROM employees
       WHERE employee_id = 100)
FROM employees;

/*  FROM절 SUB QUERY  */
-- 부서번호가 80인 사람 중 급여 10000 이상
SELECT employee_id, first_name, salary, department_id
FROM (SELECT *
      FROM employees
      WHERE department_id = 80)
WHERE salary >= 10000;

-- 부서번호가 50인 사람 중 급여 6000 이상
SELECT employee_id, salary, department_id
FROM (SELECT * FROM employees
      WHERE department_id = 50)
WHERE salary >= 6000;

-- 서브쿼리 사용 안하는 방법
SELECT employee_id, salary, department_id FROM employees
WHERE department_id = 50 AND salary >= 6000;

-- 급여, 업무명, 업무 별 급여의 합과 인원수
SELECT e.employee_id, e.salary, e.job_id, sq."급여 합계", sq.인원수
FROM employees e,
    (SELECT SUM(salary) "급여 합계", COUNT(*) 인원수, job_id
     FROM employees
     GROUP BY job_id) sq
WHERE e.job_id = sq.job_id;

/*  WHERE절 SUB QUERY  */
-- 평균급여보다 많이 받는 사원
SELECT employee_id, first_name, salary
FROM employees
WHERE (SELECT AVG(salary) FROM employees) < salary;

-- 부서별로 급여를 가장 많이 받는 사원
SELECT department_id, first_name, salary FROM employees
WHERE (department_id, salary)
    IN(SELECT department_id, MAX(salary)
       FROM employees
       GROUP BY department_id)
ORDER BY department_id;
