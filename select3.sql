/*  JOIN
    - 두 개 이상의 테이블을 연결해서 데이터를 검색하는 방법, 기본키와 외래키 사용
    
    JOIN의 종류               중요도
    - INNER, SELF            *****
    - OUTER(LEFT, RIGHT)     ***
    - FULL OUTER             *
    - CROSS, ANTI 등
*/
/*  INNER JOIN : 양쪽 테이블에서 공통으로 존재하는 데이터, 교집합  */
-- ansi SQL 문법
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

-- oracle 문법
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 1) 사원번호가 200인 사원의 부서명 조회
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.employee_id = 200;

-- 2) 업무와 업무 타이틀 조회
SELECT DISTINCT e.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY e.job_id;

/*  SELF JOIN : 동일한 테이블 JOIN  */
-- 상사의 이름 조회
SELECT a.employee_id 부하사번, a.first_name 부하이름,
       a.manager_id 상사사번, b.first_name 상사이름
FROM employees a, employees b -- a는 부하 테이블, b는 상사 테이블
WHERE a.manager_id = b.employee_id
ORDER BY a.employee_id;

/*  LEFT OUTER JOIN : INNER + 왼쪽 테이블에만 존재하는 데이터  */
-- ansi SQL 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d -- employees가 중심 테이블
ON e.department_id = d.department_id;

-- oracle 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d -- employees가 중심 테이블
WHERE e.department_id = d.department_id(+);

/*  LEFT OUTER - INNER : 차집합  */
SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) AND e.department_id IS NULL;

/*  RIGHT OUTER JOIN : INNER + 오른쪽 테이블에만 존재하는 데이터  */
-- ansi SQL 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d -- departments가 중심 테이블
ON e.department_id = d.department_id;

-- oracle 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d -- departments가 중심 테이블
WHERE e.department_id(+) = d.department_id;

/*  FULL OUTER JOIN : 모든 데이터, 합집합  */
-- ansi SQL 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- oracle 문법
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
UNION
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
    
/*  FULL OUTER - INNER : 대칭 차집합  */
-- ansi SQL 문법(oracle은 복잡)
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departmentS d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;

/*  CROSS JOIN : 모든 데이터 조합 출력, 조인 조건 X  */
-- ansi SQL 문법
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e CROSS JOIN departments d;

-- oracle 문법
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d;
