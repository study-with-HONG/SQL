/*
    Not Null : NULL X
    Primary Key : 기본키. NULL X, 중복 X    ex) id, 주민번호
    Unique Key : 고유키. NULL O, 중복 X     ex) email
    Foreign Key : 외래키. 부모테이블과 자식테이블을 연결하는 목적
                  PK나 UK로 설정되어 있어야 함. NULL O
                  ex) Employees(외래키:department_id), Departments(기본키:department_id)
    Check : 범위를 지정하고 범위 내의 값만 O, NULL O, 중복 O
*/
/*  NOT NULL  */
CREATE TABLE study_null(
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10)    
);
INSERT INTO study_null(col1, col2) VALUES('AAA', '111');
INSERT INTO study_null(col1) VALUES('BBB');
INSERT INTO study_null(col2) VALUES('222'); -- col1이 NULL
INSERT INTO study_null(col1, col2) VALUES('', '333'); -- col1이 NULL

/*  Primary Key = Unique + NOT NULL  */
CREATE TABLE study_primary(
    pkcol VARCHAR2(10) CONSTRAINT pk PRIMARY KEY,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_primary(pkcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_primary(pkcol) VALUES('BBB');
INSERT INTO study_primary(pkcol, col1, col2) VALUES('', '222', 'ccc'); -- 기본키가 NULL

/*  Unique Key  */
CREATE TABLE study_unique(
    ukcol VARCHAR2(10) CONSTRAINT uk UNIQUE,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_unique(col1, col2) VALUES('222', 'bbb');
INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '555', 'hhh'); -- 무결성 제약 조건에 위배

/*  Foreign Key  */
CREATE TABLE study_foreign_department(
    department_id NUMBER,
    department_name VARCHAR2(20),
    location_id NUMBER,
    CONSTRAINT department_pk PRIMARY KEY(department_id)
);
INSERT INTO study_foreign_department(department_id, department_name, location_id)
VALUES(100, '기획부', 82);
INSERT INTO study_foreign_department(department_id, department_name, location_id)
VALUES(200, '개발부', 13);

CREATE TABLE study_foreign_employee(
    employee_id NUMBER,
    employee_name VARCHAR2(20),
    department_id NUMBER,
    CONSTRAINT employee_fk FOREIGN KEY(department_id)
    REFERENCES study_foreign_department(department_id)
);
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1001, '가나다', 100);
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1002, '라마바', 200);
INSERT INTO study_foreign_employee(employee_id, employee_name)
VALUES(1003, '사아자'); -- NULL 가능
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1003, '차카타', 500); -- 부모키 없음

/*  CHECK  */
CREATE TABLE study_check(
    col1 VARCHAR2(10),
    col2 VARCHAR2(10),
    CONSTRAINT ck1 CHECK(col1 IN('사과', '배', '바나나')),
    CONSTRAINT ck2 CHECK(col2 > 0 AND col2 <= 10)
);
INSERT INTO study_check(col1, col2) VALUES ('사과', 5);
INSERT INTO study_check(col1) VALUES ('배');
INSERT INTO study_check(col1) VALUES ('포도'); -- 제약조건 위배
INSERT INTO study_check(col2) VALUES (20); -- 제약조건 위배

/*  DROP CONSTRAINT : 키 삭제  */
ALTER TABLE study_unique
DROP CONSTRAINT uk;

INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '555', 'hhh');

/*  무결성 성질까지 삭제  */
DROP TABLE study_foreign_department CASCADE CONSTRAINTS;