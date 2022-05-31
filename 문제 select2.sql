/*  모든 문제는 employees 테이블 사용  */
-- 1) 급여가 3000이상인 사원의 사원번호, 이름, 담당업무, 급여
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 3000;

-- 2) 업무가 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 부서번호
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';

-- 3) 2006년 1월 1일 이후에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date >= TO_DATE('20060101', 'YYYYMMDD');

-- 4) 급여가 3000 ~ 5000인 사원의 성명, 담당업무, 급여, 부서번호
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

-- 5) 사원번호가 145,152,203인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자
SELECT employee_id, first_name, job_id, salary, hire_date
FROM employees
WHERE employee_id IN(145, 142, 203);

-- 6) 2005년도에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date LIKE '2005%';

-- 7) 보너스가 없는 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE commission_pct IS NULL;

-- 8) 급여가 1100이상이고, 업무가 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 1100 AND job_id = 'ST_MAN';

-- 9) 급여가 10000이상이거나 업무가 ST_MAN인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 10000 OR job_id = 'ST_MAN';

-- 10) 업무가 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 사원번호, 성명, 담당업무, 급여, 부서번호
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE job_id NOT IN('ST_MAN', 'SA_MAN', 'SA_REP');

-- 11) 업무가 PRES이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 사원번호, 이름, 업무, 급여
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id LIKE '%PRES%' AND salary >= 12000 OR job_id = 'SA_MAN';

-- 12) 업무가 AD_PRES 또는 SA_MAN이고, 급여가 12000이상인 사원의 사원번호, 이름, 업무, 급여
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id IN('AD_PRES', 'SA_MAN') AND salary >= 12000;