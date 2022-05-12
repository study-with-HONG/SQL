-- 4-1 / 4-3 직원 데이터 INSERT
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(1, '홍길동', '남', 33, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(2, '김유신', '남', 44, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(3, '강감찬', '남', 55, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(4, '신사임당', '여', 45, '2018-01-01');

-- 4-6 DB에 변경 사항을 적용하는 트랜잭션 처리
COMMIT;

-- 4-7 아이디가 2인 직원 DELETE
DELETE FROM emp03
WHERE emp_id=2; -- WHERE절 생략하면 테이블의 모든 데이터 삭제

-- 4-11 테이블 생성
CREATE TABLE subway_statistics(
    seq_id NUMBER PRIMARY KEY,
    station_name VARCHAR2(100),
    boarding_date DATE,
    gubun VARCHAR2(10),
    boarding_time NUMBER,
    passenger_number NUMBER
);

-- 4-12 지하철 승하차 정보 입력
INSERT INTO subway_statistics values(1,'서울역(150)','2017-04-01','승차',7,654);
INSERT INTO subway_statistics values(2,'서울역(150)','2017-04-01','하차',7,1923);
INSERT INTO subway_statistics values(3,'서울역(150)','2017-04-02','승차',7,413);
INSERT INTO subway_statistics values(4,'서울역(150)','2017-04-02','하차',7,1119);
INSERT INTO subway_statistics values(7,'시청(151)','2017-04-01','승차',7,181);
INSERT INTO subway_statistics values(8,'시청(151)','2017-04-01','하차',7,674);
INSERT INTO subway_statistics values(11,'시청(151)','2017-04-03','승차',7,288);
INSERT INTO subway_statistics values(12,'시청(151)','2017-04-03','하차',7,3671);
INSERT INTO subway_statistics values(15,'종각(152)','2017-04-02','승차',7,131);
INSERT INTO subway_statistics values(16,'종각(152)','2017-04-02','하차',7,447);
INSERT INTO subway_statistics values(17,'종각(152)','2017-04-03','승차',7,320);
INSERT INTO subway_statistics values(18,'종각(152)','2017-04-03','하차',7,5683);
INSERT INTO subway_statistics values(625,'혜화(420)','2017-04-01','승차',7,418);
INSERT INTO subway_statistics values(626,'혜화(420)','2017-04-01','하차',7,596);
INSERT INTO subway_statistics values(627,'혜화(420)','2017-04-02','승차',7,259);
INSERT INTO subway_statistics values(628,'혜화(420)','2017-04-02','하차',7,296);
INSERT INTO subway_statistics values(629,'혜화(420)','2017-04-03','승차',7,893);
INSERT INTO subway_statistics values(630,'혜화(420)','2017-04-03','하차',7,2679);
INSERT INTO subway_statistics values(631,'동대문(421)','2017-04-01','승차',7,268);
INSERT INTO subway_statistics values(632,'동대문(421)','2017-04-01','하차',7,1220);
INSERT INTO subway_statistics values(633,'동대문(421)','2017-04-02','승차',7,92);
INSERT INTO subway_statistics values(634,'동대문(421)','2017-04-02','하차',7,171);
INSERT INTO subway_statistics values(635,'동대문(421)','2017-04-03','승차',7,245);
INSERT INTO subway_statistics values(636,'동대문(421)','2017-04-03','하차',7,1924);
INSERT INTO subway_statistics values(1123,'경복궁(317)','2017-04-01','승차',8,503);
INSERT INTO subway_statistics values(1124,'경복궁(317)','2017-04-01','하차',8,1030);
INSERT INTO subway_statistics values(1131,'안국(318)','2017-04-02','승차',8,203);
INSERT INTO subway_statistics values(1132,'안국(318)','2017-04-02','하차',8,816);
INSERT INTO subway_statistics values(1193,'고속터미널(329)','2017-04-03','승차',8,2806);
INSERT INTO subway_statistics values(1194,'고속터미널(329)','2017-04-03','하차',8,2900);