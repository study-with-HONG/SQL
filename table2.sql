/*
    Not Null : NULL X
    Primary Key : �⺻Ű. NULL X, �ߺ� X    ex) id, �ֹι�ȣ
    Unique Key : ����Ű. NULL O, �ߺ� X     ex) email
    Foreign Key : �ܷ�Ű. �θ����̺�� �ڽ����̺��� �����ϴ� ����
                  PK�� UK�� �����Ǿ� �־�� ��. NULL O
                  ex) Employees(�ܷ�Ű:department_id), Departments(�⺻Ű:department_id)
    Check : ������ �����ϰ� ���� ���� ���� O, NULL O, �ߺ� O
*/
/*  NOT NULL  */
CREATE TABLE study_null(
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10)    
);
INSERT INTO study_null(col1, col2) VALUES('AAA', '111');
INSERT INTO study_null(col1) VALUES('BBB');
INSERT INTO study_null(col2) VALUES('222'); -- col1�� NULL
INSERT INTO study_null(col1, col2) VALUES('', '333'); -- col1�� NULL

/*  Primary Key = Unique + NOT NULL  */
CREATE TABLE study_primary(
    pkcol VARCHAR2(10) CONSTRAINT pk PRIMARY KEY,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_primary(pkcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_primary(pkcol) VALUES('BBB');
INSERT INTO study_primary(pkcol, col1, col2) VALUES('', '222', 'ccc'); -- �⺻Ű�� NULL

/*  Unique Key  */
CREATE TABLE study_unique(
    ukcol VARCHAR2(10) CONSTRAINT uk UNIQUE,
    col1 VARCHAR2(10),
    col2 VARCHAR2(10)
);
INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '111', 'aaa');
INSERT INTO study_unique(col1, col2) VALUES('222', 'bbb');
INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '555', 'hhh'); -- ���Ἲ ���� ���ǿ� ����

/*  Foreign Key  */
CREATE TABLE study_foreign_department(
    department_id NUMBER,
    department_name VARCHAR2(20),
    location_id NUMBER,
    CONSTRAINT department_pk PRIMARY KEY(department_id)
);
INSERT INTO study_foreign_department(department_id, department_name, location_id)
VALUES(100, '��ȹ��', 82);
INSERT INTO study_foreign_department(department_id, department_name, location_id)
VALUES(200, '���ߺ�', 13);

CREATE TABLE study_foreign_employee(
    employee_id NUMBER,
    employee_name VARCHAR2(20),
    department_id NUMBER,
    CONSTRAINT employee_fk FOREIGN KEY(department_id)
    REFERENCES study_foreign_department(department_id)
);
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1001, '������', 100);
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1002, '�󸶹�', 200);
INSERT INTO study_foreign_employee(employee_id, employee_name)
VALUES(1003, '�����'); -- NULL ����
INSERT INTO study_foreign_employee(employee_id, employee_name, department_id)
VALUES(1003, '��īŸ', 500); -- �θ�Ű ����

/*  CHECK  */
CREATE TABLE study_check(
    col1 VARCHAR2(10),
    col2 VARCHAR2(10),
    CONSTRAINT ck1 CHECK(col1 IN('���', '��', '�ٳ���')),
    CONSTRAINT ck2 CHECK(col2 > 0 AND col2 <= 10)
);
INSERT INTO study_check(col1, col2) VALUES ('���', 5);
INSERT INTO study_check(col1) VALUES ('��');
INSERT INTO study_check(col1) VALUES ('����'); -- �������� ����
INSERT INTO study_check(col2) VALUES (20); -- �������� ����

/*  DROP CONSTRAINT : Ű ����  */
ALTER TABLE study_unique
DROP CONSTRAINT uk;

INSERT INTO study_unique(ukcol, col1, col2) VALUES('AAA', '555', 'hhh');

/*  ���Ἲ �������� ����  */
DROP TABLE study_foreign_department CASCADE CONSTRAINTS;