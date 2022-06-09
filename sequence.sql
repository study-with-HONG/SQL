/*  SEQUENCE 생성  */
CREATE SEQUENCE study_seq
START WITH 10       -- 시작 숫자
INCREMENT BY 1      -- 증가 단위
MAXVALUE 100
MINVALUE 1;

/*  NEXTVAL : SEQUENCE 값 증가  */
SELECT study_seq.NEXTVAL FROM dual;

/*  CURRVAL : SEQUENCE 현재 값, NEXTVAL을 먼저 실행한 후 사용  */
SELECT study_seq.CURRVAL FROM dual;

/*  SEQUENCE 수정  */
ALTER SEQUENCE study_seq
INCREMENT BY 3;

/*  SEQUENCE 삭제  */
DROP SEQUENCE study_seq;

--* sequence 이용해서 데이터 추가
CREATE TABLE student(
    num INTEGER,
    name VARCHAR2(30),
    height NUMBER(5, 1)
);

CREATE SEQUENCE seq
START WITH 1000
INCREMENT BY 1;

INSERT INTO student VALUES(seq.NEXTVAL, '학생1', 171.1);
INSERT INTO student VALUES(seq.NEXTVAL, '학생2', 189.3);
INSERT INTO student VALUES(seq.NEXTVAL, '학생3', 178.3);

SELECT * FROM student;