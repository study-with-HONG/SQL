-- 1) 이름, 부서번호, 부서명 조회
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 2) 부서번호가 30번인 사원의 이름, 업무, 업무 타이틀, 부서명
SELECT e.employee_id, e.first_name, e.job_id, j.job_title, d.department_name
FROM employees e, jobs j, departments d
WHERE e.job_id = j.job_id AND e.department_id = d.department_id
    AND e.department_id = 30;

-- 3) 보너스 받는 사원의 이름, 업무, 부서번호, 부서명
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

-- 4) 지역번호 2500에서 근무하는 사원의 이름, 업무, 부서번호, 부서명, 지역명
SELECT e.employee_id, e.first_name, e.job_id,
       e.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND l.location_id = 2500;

-- 5) 이름에 A가 들어가는 사원의 이름과 부서명
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.first_name LIKE '%a%'
ORDER BY e.first_name;

-- 6) 사원이름과 그 사원의 관리자 이름 조회
SELECT a.first_name 사원, b.first_name 관리자
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- 7) 급여가 3000 이상인 사원의 이름, 부서명, 급여
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.salary >= 3000;

-- 8) TJ(first_name)보다 늦게 입사한 사원의 이름과 입사일
SELECT b.first_name , b.hire_date
FROM employees a, employees b
WHERE a.first_name = 'TJ' AND a.hire_date < b.hire_date
ORDER BY b.hire_date;

-- 9) 급여가 3000 ~ 5000인 사원의 이름과 부서명
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.salary BETWEEN 3000 AND 5000;

-- 10) ACCOUNTING 소속 사원의 이름과 입사일
SELECT e.employee_id, e.first_name, e.hire_date, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND UPPER(d.department_name) = 'ACCOUNTING';

-- 11) 급여가 3000이하인 사원의 이름, 급여, 근무지
SELECT e.first_name, e.salary, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND e.salary <= 3000;