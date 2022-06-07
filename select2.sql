/*	모두 employees 테이블 사용

	ORDER BY절 형식
    SELECT ~ FROM ~
    WHERE ~
    ORDER BY ~ asc(오름차순, 생략 가능) / desc(내림차순)
*/
-- 1) 급여 오름차순 정렬
SELECT employee_id, first_name, salary FROM employees
ORDER BY salary;

-- 2) 급여 내림차순 정렬
SELECT employee_id, first_name, salary FROM employees
ORDER BY salary DESC;

-- 3) 1순위 입사일자 오름차순, 2순위 급여 내림차순 정렬
SELECT employee_id, first_name, hire_date, salary FROM employees
ORDER BY hire_date, salary DESC;

-- 4) 1순위 담당업무 오름차순, 2순위 급여 내림차순 정렬
SELECT employee_id, first_name, job_id, salary FROM employees
ORDER BY job_id, salary DESC;

/*  NULLS : NULL 위치 정렬  */
-- 1) NULL 값을 앞에 정렬
SELECT employee_id, first_name, commission_pct FROM employees
ORDER BY commission_pct NULLS FIRST;

-- 2) NULL 값을 뒤에 정렬
SELECT employee_id, first_name, commission_pct FROM employees
ORDER BY commission_pct NULLS LAST;

-- 3) 1순위 보너스 NULL값 뒤로, 2순위 급여 내림차순 정렬
SELECT employee_id, first_name, commission_pct, salary FROM employees
ORDER BY commission_pct NULLS LAST, salary DESC;

/*
    GROUP BY : 그룹화
    HAVING : 그룹화 후 조건
    WHERE : 그룹화 전 조건
*/
-- 1) 부서번호 그룹화 및 오름차순 정렬
SELECT department_id FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2) 담당업무 그룹화 및 오름차순 정렬
SELECT job_id FROM employees
GROUP BY job_id
ORDER BY job_id;

/*  통계 그룹함수 : COUNT, SUM, AVG, MAX, MIN  */
-- 1) 담당업무 별 인원수
SELECT job_id, COUNT(*) AS 인원수 FROM employees -- AS : 컬럼 별명, 생략 가능
GROUP BY job_id;

-- 2) 담당업무 별 급여 통계
SELECT job_id, COUNT(*) 인원수,
       SUM(salary) 합계, AVG(salary) 평균,
       MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
GROUP BY job_id
ORDER BY job_id;

-- 3) 담당업무 별 급여의 합이 100000 이상인 부서 급여 통계
SELECT job_id, COUNT(*) 인원수,
       SUM(salary) 합계, AVG(salary) 평균,
       MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 100000;

-- 4) 급여가 5000이상인 사원을 담당업무로 그룹화한 후 급여의 합이 20000을 초과하는 부서 조회
SELECT job_id, SUM(salary) 합계 FROM employees
WHERE salary >= 5000
GROUP BY job_id
HAVING SUM(salary) >= 20000;
