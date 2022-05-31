/*  모든 문제는 employees 테이블 사용  */
-- 1) 모든 데이터 출력
SELECT * FROM employees;

-- 2) 모든 컬럼 정보 출력
DESC employees; -- 이클립스에서는 안됨

-- 3) 사원번호, 이름, 급여, 담당업무 출력
SELECT employee_id, first_name, salary, job_id FROM employees;

-- 4) 사원번호, 이름, 급여, 급여 + 300 출력
SELECT employee_id, first_name, salary, salary + 300 FROM employees;

-- 5) 사원번호, 이름, 급여, 보너스, 총 급여 출력
SELECT employee_id, first_name, salary,
       NVL(salary * commission_pct, 0) 보너스,
       salary + NVL(salary * commission_pct, 0) "총 급여"
FROM employees;

-- 6) first_name은 이름, salary는 급여로 출력
SELECT first_name 이름, salary 급여 FROM employees;

-- 7) first_name은 name, salary * 12는 Annual Salary(연봉)으로 출력
SELECT first_name name, salary * 12 "Annual Salary(연봉)" FROM employees;

-- 8) 이름과 업무를 연결하여 출력
SELECT first_name || ' ' || job_id FROM employees;

-- 9) 이름과 업무를 “KING is a PRESIDENT” 형식으로 출력
SELECT first_name || ' is a ' || job_id FROM employees;

-- 10) 이름과 연봉을 “KIM : 1 Year Salary = 60000” 형식으로 출력
SELECT first_name || ' " 1 Year Salary = ' || (salary * 12) FROM employees;

-- 11) JOB을 중복생략해서 모두 출력
SELECT DISTINCT job_id FROM employees;