/*  테이블 정보가 없으면 employees 테이블 사용  */
-- 1) last_name이 Kochhar인 사원의 급여보다 많은 사원의 사원번호, 이름, 담당업무, 급여
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE last_name = 'Kochhar');

-- 2) 급여가 평균 급여보다 적은 사원의 사원번호, 이름, 담당업무, 급여, 부서번호
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- 3) 100번 부서의 최소 급여보다 최소 급여가 많은 부서
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) FROM employees
                     WHERE department_id = 100);

-- 4) 업무별 최소 급여를 받는 사원의 사원번호, 이름, 업무, 부서번호를 업무별로 정렬
SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, MIN(salary)
                          FROM employees
                          GROUP BY job_id)
ORDER BY job_id;

-- 5) 업무가 SA_MAN 사원의 이름, 업무, 부서명, 근무지를 FROM, WHERE절 둘 다 작성
-- FROM 절
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM (SELECT * FROM employees WHERE job_id = 'SA_MAN') e,
     departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id;

-- WHERE 절
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND e.employee_id IN(SELECT employee_id FROM employees
                     WHERE job_id = 'SA_MAN');

-- 6) 가장 많은 부하를 갖는 MANAGER의 사원번호
SELECT manager_id, COUNT(*)
FROM employees
GROUP BY manager_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees
                   GROUP BY manager_id);
                            
-- 7) 가장 많은 사원이 속해 있는 부서 번호와 사원수
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees
                   GROUP BY department_id);

-- 8) 123번 사원의 직업과 같고, 192번 사원의 급여보다 많은 사원의 사원번호, 이름, 직업, 급여
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 123)
    AND salary > (SELECT salary FROM employees WHERE employee_id = 192);

-- 9) 직업별로 최소급여를 받는 사원의 사원번호, 이름, 업무, 부서명을 직업별로 내림차순 정렬
SELECT e.job_id, e.employee_id, e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND (e.job_id, e.salary) IN(SELECT job_id, MIN(salary) FROM employees
                                GROUP BY job_id)
ORDER BY e.job_id DESC;

-- 10) 50번 부서는 제외하고 급여가 50번 부서의 최소 급여보다 높은 사원의 사원번호, 이름, 업무, 입사일자, 급여, 부서번호
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id = 50)
    AND department_id != 50;

-- 11) 50번 부서는 제외하고 급여가 50번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 업무, 입사일자, 급여, 부서번호
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 50)
    AND department_id != 50;