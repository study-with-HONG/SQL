/*  모두 employees 테이블 사용

    WHERE절 형식
    SELECT ~ FROM ~
    WHERE ~         -> 조건절 if
    
    - 비교연산자(>, <, >=, <=, !=, =, <>)
    - NULL, IS NULL, IS NOT NULL
    - AND -> &&, OR -> ||, ()  */
/*  비교연산자  */
-- 연습 1) first_name이 Julia
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = 'Julia';

-- 연습 2) 급여 9000이상
SELECT employee_id, first_name, salary FROM employees
WHERE salary >= 9000;

-- 연습 3) first_name이 Shanta보다 뒤
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name > 'Shanta';

-- 연습 4) first_name 첫 글자가 J보다 뒤
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name > 'J';

-- 연습 5) 2007/12/31 이후에 입사
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date > TO_DATE('20071231', 'YYYYMMDD');

/*  NULL, NOT NULL  */
-- 연습 1) 매니저(상사)X
SELECT employee_id, first_name, manager_id FROM employees
WHERE manager_id IS NULL;

-- 연습 2) commission_pct(보너스) O
SELECT employee_id, first_name, commission_pct FROM employees
WHERE commission_pct IS NOT NULL;

/*  AND  */
-- 연습 1) first_name이 Shanta, last_name이 Vollman
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = 'Shanta' AND last_name = 'Vollman';

-- 연습 2) first_name이 John, 급여 5000 이상
SELECT employee_id, first_name, salary FROM employees
WHERE first_name = 'John' AND salary > 5000;

-- 연습 3) 2006년도에 입사
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date >= TO_DATE('20060101', 'YYYYMMDD')
    AND hire_date <= TO_DATE('20061231', 'YYYYMMDD');

/*  ALL(=AND), ANY(=OR)  */
-- 연습 1) first_name이 Julia면서 John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = ALL('Julia', 'John'); -- 둘 다 충족될 수 없기에 출력 X

-- 연습 2) first_name이 Julia이거나 John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name = ANY('Julia', 'John');

-- 연습 3) 급여가 3200, 6000, 8000
SELECT employee_id, first_name, salary FROM employees
WHERE salary = ANY(8000, 3200, 6000);

/*  IN(ANY보다 많이 사용), NOT IN  */
-- 연습 1) 급여가 3200, 6000, 8000
SELECT employee_id, first_name, salary FROM employees
WHERE salary IN(3200, 6000, 8000);

-- 연습 2) 급여가 3200, 6000, 8000 이외
SELECT employee_id, first_name, salary FROM employees
WHERE salary NOT IN(3200, 6000, 8000);

-- 연습 3) first_name이 Julia이거나 John
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name IN('Julia', 'John');

-- 연습 4) commission_pct(보너스) X
SELECT employee_id, first_name, commission_pct FROM employees
WHERE commission_pct IS NULL;

/*  BETWEEN : 범위 연산자  */
-- 연습 1) 급여 3200 ~ 9000
SELECT employee_id, first_name, salary FROM employees
--WHERE salary >= 3200 AND salary <= 9000;
WHERE salary BETWEEN 3200 AND 9000; -- 위보다 간편

-- 연습 2) 급여 3200 미만, 9000 초과
SELECT employee_id, first_name, salary FROM employees
WHERE salary NOT BETWEEN 3200 AND 9000;

/*  !=, <> 둘이 같은 기능  */
-- 연습 1) 급여가 7000
SELECT employee_id, first_name, salary FROM employees
WHERE salary = 7000;

-- 연습 2) 급여가 7000 이외
SELECT employee_id, first_name, salary FROM employees
WHERE salary != 7000;

SELECT employee_id, first_name, salary FROM employees
WHERE salary <> 7000;

/*  LIKE  */
-- 연습 1) first_name이 G_ra_d
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _는 한글자를 의미

-- 연습 2) K로 시작하고 y로 끝나는 first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'K%y'; -- %는 글자수 모두 허용

-- 연습 3) A로 시작하는 first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE 'A%';

-- 연습 4) 중간에 E가 들어가는 first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE '%e%';

-- 연습 5) y로 끝나는 first_name
SELECT employee_id, first_name, last_name FROM employees
WHERE first_name LIKE '%y';

-- 연습 6) 2005년도에 입사
SELECT employee_id, first_name, hire_date FROM employees
WHERE hire_date LIKE '2005%';

-- 연습 7) 폰번호가 590으로 시작하고 급여 5000 이상
SELECT employee_id, first_name, phone_number, salary FROM employees
WHERE phone_number LIKE '590%' AND salary >= 5000;