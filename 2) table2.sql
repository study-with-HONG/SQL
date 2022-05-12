/*
    Primary Key : 기본키. NULL(빈칸) X, 중복 X    ex) id, 주민번호
    Unique Key : 고유키. NULL(빈칸) O, 중복 X     ex) email
    Foreign Key : 외래키. 부모테이블과 자식테이블을 연결하는 목적
                  Employees(외래키:department_id), Departments(기본키:department_id)
                  PK나 UK로 설정되어 있어야 함. NULL O
    Check : 범위를 지정하고 범위 내의 값만 O, NULL O, 중복 O
*/
-- 무결성 성질까지 삭제
DROP TABLE 테이블명 CASCADE CONSTRAINTS;

-- NOT NULL
CREATE TABLE study_null(
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10)    
);
INSERT INTO study_null(col1, col2) VALUES('AAA', '111');
INSERT INTO study_null(col1) VALUES('BBB');
/*  INSERT INTO test03(col2) VALUES('222');
    --> col1값이 NULL이라 오류 발생   */

-- Primary Key = Unique + NOT NULL
CREATE TABLE study_primary(
    pkcol VARCHAR2(10) CONSTRAINT pk PRIMARY KEY,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_primary(pkcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_primary(pkcol) VALUES('BBB');

-- Unique Key
CREATE TABLE study_unique(
    ukcol VARCHAR2(10) CONSTRAINT uk UNIQUE,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_unique(col1, col2) VALUES('222', 'bbb');

-- UK, PK 삭제
ALTER TABLE study_unique
DROP CONSTRAINT uk;

-- Foreign Key
CREATE TABLE study_foreign_department(
    department_num NUMBER,
    department_name VARCHAR2(20),
    location_num NUMBER,
    CONSTRAINT department_pk PRIMARY KEY(department_num)
);
INSERT INTO study_foreign_department(department_num, department_name, location_num)
VALUES(100, '기획부', 82);
INSERT INTO study_foreign_department(department_num, department_name, location_num)
VALUES(200, '개발부', 13);

CREATE TABLE study_foreign_employee(
    employee_num NUMBER,
    employee_name VARCHAR2(20),
    department_num NUMBER,
    CONSTRAINT employee_fk FOREIGN KEY(department_num)
    REFERENCES study_foreign_department(department_num)
);
INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
VALUES(1001, '가나다', 100);
INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
VALUES(1002, '라마바', 200);
INSERT INTO study_foreign_employee(employee_num, employee_name)
VALUES(1003, '사아자'); -- NULL 가능
/*  INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
    VALUES(1003, '차카타', 500);
    --> 부모키가 없어서 오류    */

-- CHECK
CREATE TABLE study_check(
    col1 VARCHAR2(10),
    col2 VARCHAR2(10),
    CONSTRAINT ck1 CHECK(col1 IN('사과', '배', '바나나')),
    CONSTRAINT ck2 CHECK(col2 > 0 AND col2 <= 10)
);
INSERT INTO study_check(col1, col2) VALUES ('사과', 5);
INSERT INTO study_check(col1) VALUES ('배');
/*   INSERT INTO study_check(col2) VALUES (20);
     --> 제약조건에 위배돼서 오류 발생   */