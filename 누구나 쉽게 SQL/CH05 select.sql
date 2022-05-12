-- 5-2 Ư�� �÷��� ��ȸ
SELECT seq_id, station_name, boarding_time, passenger_number
FROM subway_statistics;

-- 5-3 ������ ���� ��ȸ / WHERE
SELECT * FROM subway_statistics
WHERE station_name='����';

-- 5-5 ���￪���� 7�ó� 9�ÿ� �������� ���� ��ȸ / AND, OR
SELECT * FROM subway_statistics
WHERE station_name='���￪' AND (boarding_time=7 OR boarding_time=9);

-- 5-6 '��'�� �����ϴ� ��� �� ��ȸ / LIKE, %
SELECT * FROM subway_statistics
WHERE station_name LIKE '��%';

-- 5-7 ��û������ 7�ó� 9�ÿ� �������� ���� ��ȸ / IN
SELECT * FROM subway_statistics
WHERE station_name='��û' AND boarding_time IN(7, 9);

-- 5-8 ���￪���� ������ �ο��� 500 ~ 1000�� ���� ��ȸ
SELECT * FROM subway_statistics
WHERE station_name='���￪'
    AND passenger_number>=500 AND passenger_number<= 1000;
    
-- 5-9 ���� ���� / BETWEEN
SELECT * FROM subway_statistics
WHERE station_name='���￪'
    AND passenger_number BETWEEN 500 AND 1000;
    
-- 5-10 ���̸����� ���� / ORDER BY
SELECT * FROM subway_statistics
ORDER BY station_name;

-- 5-11 ��û�������͸� ��ȸ�ϴµ� ��� �÷��� ������� ����
SELECT * FROM subway_statistics
WHERE station_name='��û'
ORDER BY 1, 2, 3, 4, 5, 6;