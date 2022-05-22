-- 11-1 AS를 이용한 테이블 생성 : SELECT절 결과 형태로 테이블과 데이터 복사
CREATE TABLE subway_clone AS
SELECT * FROM subway_statistics
WHERE ROWNUM < 1; -- 반환되는 로우 수 1미만 -> 데이터는 복사 X

ALTER TABLE subway_clone -- 기본 키 생성
ADD PRIMARY KEY(seq_id);

-- 11-2 INSERT SELECT 문으로 데이터 입력
INSERT INTO subway_clone
SELECT * FROM subway_statistics
WHERE station_name LIKE '서울%';

-- 11-5 나머지 데이터 입력
INSERT INTO subway_clone
SELECT * FROM subway_statistics
WHERE station_name NOT LIKE '서울%';

-- 11-6 기본 키와 충돌하지 않게 데이터 입력
INSERT INTO subway_clone
SELECT s.* FROM subway_statistics s
WHERE NOT EXISTS(SELECT * FROM subway_clone c
                 WHERE c.seq_id=s.seq_id);
                 
-- 11-7 데이터 삭제 / DELETE
DELETE FROM subway_clone
WHERE station_name LIKE '서울%';

-- 11-8 데이터 수정 / UPDATE
UPDATE subway_clone
SET passenger_number = passenger_number + 30
WHERE station_name='교대';