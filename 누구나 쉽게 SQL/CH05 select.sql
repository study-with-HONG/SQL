-- 5-2 특정 컬럼만 조회
SELECT seq_id, station_name, boarding_time, passenger_number
FROM subway_statistics;

-- 5-3 강남역 정보 조회 / WHERE
SELECT * FROM subway_statistics
WHERE station_name='강남';

-- 5-5 서울역에서 7시나 9시에 승하차한 정보 조회 / AND, OR
SELECT * FROM subway_statistics
WHERE station_name='서울역' AND (boarding_time=7 OR boarding_time=9);

-- 5-6 '교'로 시작하는 모든 역 조회 / LIKE, %
SELECT * FROM subway_statistics
WHERE station_name LIKE '교%';

-- 5-7 시청역에서 7시나 9시에 승하차한 정보 조회 / IN
SELECT * FROM subway_statistics
WHERE station_name='시청' AND boarding_time IN(7, 9);

-- 5-8 서울역에서 승하차 인원이 500 ~ 1000인 정보 조회
SELECT * FROM subway_statistics
WHERE station_name='서울역'
    AND passenger_number>=500 AND passenger_number<= 1000;
    
-- 5-9 위와 동일 / BETWEEN
SELECT * FROM subway_statistics
WHERE station_name='서울역'
    AND passenger_number BETWEEN 500 AND 1000;
    
-- 5-10 역이름으로 정렬 / ORDER BY
SELECT * FROM subway_statistics
ORDER BY station_name;

-- 5-11 시청역데이터를 조회하는데 모든 컬럼을 순서대로 정렬
SELECT * FROM subway_statistics
WHERE station_name='시청'
ORDER BY 1, 2, 3, 4, 5, 6;