-- 7-1 GROUP BY
SELECT station_name FROM subway_statistics
GROUP BY station_name
ORDER BY station_name;

-- 7-2 집계함수 사용 / GROUP BY X
SELECT COUNT(*) 데이터수, MAX(passenger_number) 최대값, MIN(passenger_number) 최소값,
       SUM(passenger_number) 합계, AVG(passenger_number) 평균,
       VARIANCE(passenger_number) 분산, STDDEV(passenger_number) 표준편차
FROM subway_statistics;

-- 7-3 지하철역별 승하차인원 / GROUP BY O
SELECT station_name 역명, COUNT(*) 데이터수,
       MAX(passenger_number) 최대값, MIN(passenger_number) 최소값,
       SUM(passenger_number) 합계, AVG(passenger_number) 평균
FROM subway_statistics
GROUP BY station_name
ORDER BY station_name;

-- 7-4 서울역 시간별 승하차인원
SELECT station_name 역명, boarding_time 시간,
       MAX(passenger_number) 최대값, MIN(passenger_number) 최소값,
       SUM(passenger_number) 합계, AVG(passenger_number) 평균
FROM subway_statistics
WHERE station_name='서울역'
GROUP BY station_name, boarding_time
ORDER BY boarding_time;

-- 7-5 승하차 인원이 많은 순서
SELECT station_name 역명, boarding_time 시간,
       MAX(passenger_number) 최대값, MIN(passenger_number) 최소값,
       SUM(passenger_number) 합계, AVG(passenger_number) 평균
FROM subway_statistics
GROUP BY station_name, boarding_time
ORDER BY 평균 DESC; -- 평균대신 AVG(passenger_number)나 6으로 해도 됨.

-- 7-6 HAVING : GROUP BY에 조건을 걸 때 사용
--     평균 승하차 인원이 1000~2000인 데이터 조회
SELECT station_name 역명, boarding_time 시간,
       MAX(passenger_number) 최대값, MIN(passenger_number) 최소값,
       SUM(passenger_number) 합계, AVG(passenger_number) 평균
FROM subway_statistics
GROUP BY station_name, boarding_time
HAVING AVG(passenger_number) BETWEEN 1000 AND 2000
ORDER BY AVG(passenger_number) DESC;

-- 7-7 중복을 제외한 유일한 값만 조회 / DISTINCT
SELECT DISTINCT station_name
FROM subway_statistics
ORDER BY station_name;