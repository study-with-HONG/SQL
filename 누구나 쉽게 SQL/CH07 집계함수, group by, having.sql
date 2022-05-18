-- 7-1 GROUP BY
SELECT station_name FROM subway_statistics
GROUP BY station_name
ORDER BY station_name;

-- 7-2 �����Լ� ��� / GROUP BY X
SELECT COUNT(*) �����ͼ�, MAX(passenger_number) �ִ밪, MIN(passenger_number) �ּҰ�,
       SUM(passenger_number) �հ�, AVG(passenger_number) ���,
       VARIANCE(passenger_number) �л�, STDDEV(passenger_number) ǥ������
FROM subway_statistics;

-- 7-3 ����ö���� �������ο� / GROUP BY O
SELECT station_name ����, COUNT(*) �����ͼ�,
       MAX(passenger_number) �ִ밪, MIN(passenger_number) �ּҰ�,
       SUM(passenger_number) �հ�, AVG(passenger_number) ���
FROM subway_statistics
GROUP BY station_name
ORDER BY station_name;

-- 7-4 ���￪ �ð��� �������ο�
SELECT station_name ����, boarding_time �ð�,
       MAX(passenger_number) �ִ밪, MIN(passenger_number) �ּҰ�,
       SUM(passenger_number) �հ�, AVG(passenger_number) ���
FROM subway_statistics
WHERE station_name='���￪'
GROUP BY station_name, boarding_time
ORDER BY boarding_time;

-- 7-5 ������ �ο��� ���� ����
SELECT station_name ����, boarding_time �ð�,
       MAX(passenger_number) �ִ밪, MIN(passenger_number) �ּҰ�,
       SUM(passenger_number) �հ�, AVG(passenger_number) ���
FROM subway_statistics
GROUP BY station_name, boarding_time
ORDER BY ��� DESC; -- ��մ�� AVG(passenger_number)�� 6���� �ص� ��.

-- 7-6 HAVING : GROUP BY�� ������ �� �� ���
--     ��� ������ �ο��� 1000~2000�� ������ ��ȸ
SELECT station_name ����, boarding_time �ð�,
       MAX(passenger_number) �ִ밪, MIN(passenger_number) �ּҰ�,
       SUM(passenger_number) �հ�, AVG(passenger_number) ���
FROM subway_statistics
GROUP BY station_name, boarding_time
HAVING AVG(passenger_number) BETWEEN 1000 AND 2000
ORDER BY AVG(passenger_number) DESC;

-- 7-7 �ߺ��� ������ ������ ���� ��ȸ / DISTINCT
SELECT DISTINCT station_name
FROM subway_statistics
ORDER BY station_name;