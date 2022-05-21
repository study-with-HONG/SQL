-- 10-1 스칼라 서브쿼리 : 메인쿼리의 SELECT 절에서 사용. 반드시 하나의 컬럼과 로우 반환
SELECT e.emp_id, e.emp_name, e.gender, e.age, e.dept_id,
       (SELECT d.dept_name FROM master_department d
        WHERE e.dept_id=d.dept_id) dept_name
FROM master_employee e;

-- 10-2 외부조인으로 변경
SELECT e.emp_id, e.emp_name, e.gender, e.age, e.dept_id, d.dept_name
FROM master_employee e, master_department d
WHERE e.dept_id=d.dept_id(+);

-- 10-3 인라인 뷰 : 메인쿼리의 FROM 절에서 사용. 여러 개의 컬럼과 로우 반환
SELECT d.dept_id, d.dept_name, i.emp_id, i.emp_name, i.address
FROM master_department d,
    (SELECT e.emp_id, e.emp_name, e.dept_id, a.si||' '||a.gu||' '||a.etc address
     FROM master_employee e, master_address a
     WHERE e.adrs_id=a.adrs_id) i
WHERE d.dept_id=i.dept_id
ORDER BY 1, 3;

-- 10-4 중첩 서브쿼리 : WHERE 절에서 사용. 여러 개의 컬럼과 로우 반환
SELECT * FROM master_department d
WHERE d.dept_id=(SELECT e.dept_id FROM master_employee e
                 WHERE e.emp_name LIKE '홍길동%');
                 
-- 10-5 중첩 서브쿼리 다중 행 반환
SELECT * FROM master_department d
WHERE d.dept_id IN (SELECT e.dept_id FROM master_employee e
                    WHERE e.age BETWEEN 30 AND 50);

-- 10-6 중첩 서브쿼리 다중 컬럼, 다중 행 반환
SELECT * FROM master_employee e
WHERE (e.gender, e.age)
    IN (SELECT ee.gender, ee.age
        FROM master_employee ee, master_address a
        WHERE ee.adrs_id=a.adrs_id AND a.gu IN ('중구', '서대문구'));
        
-- 10-7 세미 조인 : 중첩 서브쿼리 방법 이용
--      EXISTS : 메인쿼리를 기준으로 서브쿼리에서 반환하는 데이터가 존재하면 TRUE 반환
SELECT * FROM master_department d
WHERE EXISTS (SELECT '아무거나 작성' FROM master_employee e
              WHERE e.age BETWEEN 30 AND 50 AND d.dept_id=e.dept_id);

-- 10-8 안티 조인 : 세미 조인과 같은 형식. NOT 사용
SELECT * FROM master_department d
WHERE d.dept_id NOT IN (SELECT e.dept_id FROM master_employee e
                        WHERE e.age BETWEEN 30 AND 50
                            AND e.dept_id IS NOT NULL);
                -- 서브쿼리 결과에 NULL이 있으면 조건 전체가 FALSE가 돼서
                -- 아무 결과도 나오지 않아 IS NOT NULL 조건을 넣어줘야 함

-- 10-9 NOT EXISTS을 사용한 안티 조인
SELECT * FROM master_department d
WHERE NOT EXISTS (SELECT '아무거나 작성' FROM master_employee e
                  WHERE e.age BETWEEN 30 AND 50 AND d.dept_id=e.dept_id);



