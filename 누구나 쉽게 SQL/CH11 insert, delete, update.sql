-- 11-1 AS�� �̿��� ���̺� ���� : SELECT�� ��� ���·� ���̺�� ������ ����
CREATE TABLE subway_clone AS
SELECT * FROM subway_statistics
WHERE ROWNUM < 1; -- ��ȯ�Ǵ� �ο� �� 1�̸� -> �����ʹ� ���� X

ALTER TABLE subway_clone -- �⺻ Ű ����
ADD PRIMARY KEY(seq_id);

-- 11-2 INSERT SELECT ������ ������ �Է�
INSERT INTO subway_clone
SELECT * FROM subway_statistics
WHERE station_name LIKE '����%';

-- 11-5 ������ ������ �Է�
INSERT INTO subway_clone
SELECT * FROM subway_statistics
WHERE station_name NOT LIKE '����%';

-- 11-6 �⺻ Ű�� �浹���� �ʰ� ������ �Է�
INSERT INTO subway_clone
SELECT s.* FROM subway_statistics s
WHERE NOT EXISTS(SELECT * FROM subway_clone c
                 WHERE c.seq_id=s.seq_id);
                 
-- 11-7 ������ ���� / DELETE
DELETE FROM subway_clone
WHERE station_name LIKE '����%';

-- 11-8 ������ ���� / UPDATE
UPDATE subway_clone
SET passenger_number = passenger_number + 30
WHERE station_name='����';