/*  테이블 정보가 없으면 employees 테이블 사용  */
/*  별칭 문제  */
-- 1) first_name은 이름, salary는 급여로 출력
SELECT first_name 이름, salary 급여 FROM employees;

-- 2) first_name은 name, salary * 12는 Annual Salary(연봉)으로 출력
SELECT first_name name, salary * 12 "Annual Salary(연봉)" FROM employees;

-- 3) 사원번호, 이름, 급여, 보너스, 총 급여 출력
SELECT employee_id, first_name, salary,
       NVL(salary * commission_pct, 0) 보너스,
       salary + NVL(salary * commission_pct, 0) "총 급여"
FROM employees;

/*  정렬 문제  */
-- 1) 입사일자 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호 조회
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
ORDER BY hire_date;

-- 2) 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호 조회
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
ORDER BY hire_date DESC;

-- 3) 1순위 부서번호, 2순위 급여가 많은 순으로 사원번호, 성명, 업무, 부서번호, 급여 조회
SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- 4) 1순위 부서번호, 2순위 업무, 3순위 급여가 많은 순으로 사원번호, 성명, 입사일자, 부서번호, 업무, 급여 조회
SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM employees
ORDER BY department_id, job_id, salary DESC;

/*  그룹화 문제  */
-- 1) 모든 판매원(SA)의 급여 통계
SELECT SUM(salary) 합계, AVG(salary) 평균, MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
WHERE job_id LIKE 'SA%';

-- 2) 테이블에 있는 총 인원, 보너스를 받는 인원, 평균 보너스, 등록되어 있는 부서의 수 조회
SELECT COUNT(*) "총 인원", COUNT(commission_pct) "보너스 받는 인원",
       ROUND(AVG(salary * commission_pct)) "평균 보너스",
       COUNT(DISTINCT department_id) "총 부서 수"
FROM employees;

-- 3) 부서별 인원수 및 급여 통계
SELECT department_id, COUNT(*) 인원수,
       SUM(salary) 합계, ROUND(AVG(salary)) 평균,
       MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
GROUP BY department_id;

-- 4) 부서별 인원수 및 급여 통계를 구한 후 급여의 합이 많은 순으로 조회
SELECT department_id, COUNT(*) 인원수,
       SUM(salary) 합계, ROUND(AVG(salary)) 평균,
       MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
GROUP BY department_id
ORDER BY 합계 DESC; -- 별칭 사용 가능

-- 5) 부서와 업무로 그룹화 후 부서번호, 업무, 인원수, 평균 급여, 급여의 합 조회
SELECT department_id, job_id, COUNT(*) 인원수, ROUND(AVG(salary)) 평균, SUM(salary) 합계
FROM employees
GROUP BY department_id, job_id;

-- 6) 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합 조회
SELECT department_id, COUNT(*) 인원수, SUM(salary) 합계
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 4;

-- 7) 최대 급여가 10000이상인 부서의 부서번호, 평균 급여, 급여의 합 조회
SELECT department_id, MAX(salary) 최대급여, ROUND(AVG(salary)) 평균, SUM(salary) 합계
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

-- 8) 평균 급여가 10000 이상인 업무의 이름, 평균 급여, 급여의 합 조회
SELECT job_id, ROUND(AVG(salary)) 평균, SUM(salary) 합계
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 10000;

-- 9) 전체 월급이 10000을 초과하는 업무와 급여의 합 조회, 단 판매원(SA)은 제외하고 급여 합계로 내림차순 정렬
SELECT job_id, SUM(salary) 합계
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary) DESC;

/*  표준함수 문제  */
-- 1) last_name에서 King을 대문자로 검색 후 사원번호, 성명, 담당업무, 부서번호 조회 / UPPER
SELECT employee_id, last_name, first_name, job_id, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

-- 2) departments 테이블에서 부서번호와 부서이름을 연결해서 조회 / CONCAT
SELECT CONCAT(department_id, department_name)
FROM departments;

-- 3) first_name에서 ‘e’ 위치 찾기 / INSTR
SELECT first_name, INSTR(first_name,'e')
FROM employees;

-- 4) first_name에서 두번째 ‘e’ 위치 찾기 / INSTR
SELECT first_name, INSTR(first_name,'e', 1, 2)
FROM employees;

-- 5) 부서번호가 80인 사람의 급여를 30으로 나눈 나머지 출력 / MOD
SELECT department_id, first_name, salary, MOD(salary, 30)
FROM employees
WHERE department_id = 80;

-- 6) 근무 일수가 많은 순으로 현재까지 근무일 수가 몇 주 며칠 인지 출력 / SYSDATE, TRUNC
SELECT first_name, hire_date, TRUNC(SYSDATE - hire_date) 일, TRUNC((SYSDATE - hire_date)/7) 주
FROM employees
ORDER BY hire_date;

-- 7) 부서번호가 50인 부서의 급여 앞에 $를 삽입하고 3자리마다 , 출력 / TO_CHAR
SELECT first_name, TO_CHAR(salary, '$9,999,999') 급여
FROM employees
WHERE department_id = 50;
