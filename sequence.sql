/*  SEQUENCE ����  */
CREATE SEQUENCE study_seq
START WITH 10       -- ���� ����
INCREMENT BY 1      -- ���� ����
MAXVALUE 100
MINVALUE 1;

/*  NEXTVAL : SEQUENCE �� ����  */
SELECT study_seq.NEXTVAL FROM dual;

/*  CURRVAL : SEQUENCE ���� ��, NEXTVAL�� ���� ������ �� ���  */
SELECT study_seq.CURRVAL FROM dual;

/*  SEQUENCE ����  */
ALTER SEQUENCE study_seq
INCREMENT BY 3;

/*  SEQUENCE ����  */
DROP SEQUENCE study_seq;

--* sequence �̿��ؼ� ������ �߰�
CREATE TABLE student(
    num INTEGER,
    name VARCHAR2(30),
    height NUMBER(5, 1)
);

CREATE SEQUENCE seq
START WITH 1000
INCREMENT BY 1;

INSERT INTO student VALUES(seq.NEXTVAL, '�л�1', 171.1);
INSERT INTO student VALUES(seq.NEXTVAL, '�л�2', 189.3);
INSERT INTO student VALUES(seq.NEXTVAL, '�л�3', 178.3);

SELECT * FROM student;