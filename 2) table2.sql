/*
    Primary Key : �⺻Ű. NULL(��ĭ) X, �ߺ� X    ex) id, �ֹι�ȣ
    Unique Key : ����Ű. NULL(��ĭ) O, �ߺ� X     ex) email
    Foreign Key : �ܷ�Ű. �θ����̺�� �ڽ����̺��� �����ϴ� ����
                  Employees(�ܷ�Ű:department_id), Departments(�⺻Ű:department_id)
                  PK�� UK�� �����Ǿ� �־�� ��. NULL O
    Check : ������ �����ϰ� ���� ���� ���� O, NULL O, �ߺ� O
*/
-- ���Ἲ �������� ����
DROP TABLE ���̺�� CASCADE CONSTRAINTS;

-- NOT NULL
CREATE TABLE study_null(
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10)    
);
INSERT INTO study_null(col1, col2) VALUES('AAA', '111');
INSERT INTO study_null(col1) VALUES('BBB');
/*  INSERT INTO test03(col2) VALUES('222');
    --> col1���� NULL�̶� ���� �߻�   */

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

-- UK, PK ����
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
VALUES(100, '��ȹ��', 82);
INSERT INTO study_foreign_department(department_num, department_name, location_num)
VALUES(200, '���ߺ�', 13);

CREATE TABLE study_foreign_employee(
    employee_num NUMBER,
    employee_name VARCHAR2(20),
    department_num NUMBER,
    CONSTRAINT employee_fk FOREIGN KEY(department_num)
    REFERENCES study_foreign_department(department_num)
);
INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
VALUES(1001, '������', 100);
INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
VALUES(1002, '�󸶹�', 200);
INSERT INTO study_foreign_employee(employee_num, employee_name)
VALUES(1003, '�����'); -- NULL ����
/*  INSERT INTO study_foreign_employee(employee_num, employee_name, department_num)
    VALUES(1003, '��īŸ', 500);
    --> �θ�Ű�� ��� ����    */

-- CHECK
CREATE TABLE study_check(
    col1 VARCHAR2(10),
    col2 VARCHAR2(10),
    CONSTRAINT ck1 CHECK(col1 IN('���', '��', '�ٳ���')),
    CONSTRAINT ck2 CHECK(col2 > 0 AND col2 <= 10)
);
INSERT INTO study_check(col1, col2) VALUES ('���', 5);
INSERT INTO study_check(col1) VALUES ('��');
/*   INSERT INTO study_check(col2) VALUES (20);
     --> �������ǿ� ����ż� ���� �߻�   */