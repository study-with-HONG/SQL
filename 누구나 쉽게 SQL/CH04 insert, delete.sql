-- 4-1 / 4-3 직원 데이터 INSERT
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(1, '홍길동', '남', 33, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(2, '김유신', '남', 44, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(3, '강감찬', '남', 55, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(4, '신사임당', '남', 45, '2018-01-01'); -- 일부러 남자라고 함.

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
INSERT INTO subway_statistics values(1,'서울역','2017-04-01','승차',7,654);
INSERT INTO subway_statistics values(2,'서울역','2017-04-01','하차',7,1923);
INSERT INTO subway_statistics values(3,'서울역','2017-04-02','승차',7,413);
INSERT INTO subway_statistics values(4,'서울역','2017-04-02','하차',7,1119);
INSERT INTO subway_statistics values(5,'서울역','2017-04-03','승차',7,2137);
INSERT INTO subway_statistics values(6,'서울역','2017-04-03','하차',7,5344);
INSERT INTO subway_statistics values(7,'시청','2017-04-01','승차',7,181);
INSERT INTO subway_statistics values(8,'시청','2017-04-01','하차',7,674);
INSERT INTO subway_statistics values(9,'시청','2017-04-02','승차',7,144);
INSERT INTO subway_statistics values(10,'시청','2017-04-02','하차',7,396);
INSERT INTO subway_statistics values(11,'시청','2017-04-03','승차',7,288);
INSERT INTO subway_statistics values(12,'시청','2017-04-03','하차',7,3671);
INSERT INTO subway_statistics values(715,'서울역','2017-04-01','승차',8,1517);
INSERT INTO subway_statistics values(716,'서울역','2017-04-01','하차',8,2511);
INSERT INTO subway_statistics values(717,'서울역','2017-04-02','승차',8,944);
INSERT INTO subway_statistics values(718,'서울역','2017-04-02','하차',8,1369);
INSERT INTO subway_statistics values(719,'서울역','2017-04-03','승차',8,3296);
INSERT INTO subway_statistics values(720,'서울역','2017-04-03','하차',8,10582);
INSERT INTO subway_statistics values(721,'시청','2017-04-01','승차',8,239);
INSERT INTO subway_statistics values(722,'시청','2017-04-01','하차',8,1108);
INSERT INTO subway_statistics values(723,'시청','2017-04-02','승차',8,191);
INSERT INTO subway_statistics values(724,'시청','2017-04-02','하차',8,824);
INSERT INTO subway_statistics values(725,'시청','2017-04-03','승차',8,401);
INSERT INTO subway_statistics values(726,'시청','2017-04-03','하차',8,8273);
INSERT INTO subway_statistics values(1429,'서울역','2017-04-01','승차',9,2104);
INSERT INTO subway_statistics values(1430,'서울역','2017-04-01','하차',9,3377);
INSERT INTO subway_statistics values(1431,'서울역','2017-04-02','승차',9,1533);
INSERT INTO subway_statistics values(1432,'서울역','2017-04-02','하차',9,1958);
INSERT INTO subway_statistics values(1433,'서울역','2017-04-03','승차',9,2121);
INSERT INTO subway_statistics values(1434,'서울역','2017-04-03','하차',9,5197);
INSERT INTO subway_statistics values(1435,'시청','2017-04-01','승차',9,367);
INSERT INTO subway_statistics values(1436,'시청','2017-04-01','하차',9,1387);
INSERT INTO subway_statistics values(1437,'시청','2017-04-02','승차',9,338);
INSERT INTO subway_statistics values(1438,'시청','2017-04-02','하차',9,909);
INSERT INTO subway_statistics values(1439,'시청','2017-04-03','승차',9,473);
INSERT INTO subway_statistics values(1440,'시청','2017-04-03','하차',9,3011);
INSERT INTO subway_statistics values(1195,'교대','2017-04-01','승차',8,214);
INSERT INTO subway_statistics values(1196,'교대','2017-04-01','하차',8,307);
INSERT INTO subway_statistics values(1617,'강남','2017-04-02','승차',9,1225);
INSERT INTO subway_statistics values(1618,'강남','2017-04-02','하차',9,3304);
