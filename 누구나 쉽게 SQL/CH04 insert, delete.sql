-- 4-1 / 4-3 ���� ������ INSERT
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(1, 'ȫ�浿', '��', 33, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(2, '������', '��', 44, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(3, '������', '��', 55, '2018-01-01');
INSERT INTO emp03(emp_id, emp_name, gender, age, hire_date)
VALUES(4, '�Ż��Ӵ�', '��', 45, '2018-01-01');

-- 4-6 DB�� ���� ������ �����ϴ� Ʈ����� ó��
COMMIT;

-- 4-7 ���̵� 2�� ���� DELETE
DELETE FROM emp03
WHERE emp_id=2; -- WHERE�� �����ϸ� ���̺��� ��� ������ ����

-- 4-11 ���̺� ����
CREATE TABLE subway_statistics(
    seq_id NUMBER PRIMARY KEY,
    station_name VARCHAR2(100),
    boarding_date DATE,
    gubun VARCHAR2(10),
    boarding_time NUMBER,
    passenger_number NUMBER
);

-- 4-12 ����ö ������ ���� �Է�
INSERT INTO subway_statistics values(1,'���￪(150)','2017-04-01','����',7,654);
INSERT INTO subway_statistics values(2,'���￪(150)','2017-04-01','����',7,1923);
INSERT INTO subway_statistics values(3,'���￪(150)','2017-04-02','����',7,413);
INSERT INTO subway_statistics values(4,'���￪(150)','2017-04-02','����',7,1119);
INSERT INTO subway_statistics values(7,'��û(151)','2017-04-01','����',7,181);
INSERT INTO subway_statistics values(8,'��û(151)','2017-04-01','����',7,674);
INSERT INTO subway_statistics values(11,'��û(151)','2017-04-03','����',7,288);
INSERT INTO subway_statistics values(12,'��û(151)','2017-04-03','����',7,3671);
INSERT INTO subway_statistics values(15,'����(152)','2017-04-02','����',7,131);
INSERT INTO subway_statistics values(16,'����(152)','2017-04-02','����',7,447);
INSERT INTO subway_statistics values(17,'����(152)','2017-04-03','����',7,320);
INSERT INTO subway_statistics values(18,'����(152)','2017-04-03','����',7,5683);
INSERT INTO subway_statistics values(625,'��ȭ(420)','2017-04-01','����',7,418);
INSERT INTO subway_statistics values(626,'��ȭ(420)','2017-04-01','����',7,596);
INSERT INTO subway_statistics values(627,'��ȭ(420)','2017-04-02','����',7,259);
INSERT INTO subway_statistics values(628,'��ȭ(420)','2017-04-02','����',7,296);
INSERT INTO subway_statistics values(629,'��ȭ(420)','2017-04-03','����',7,893);
INSERT INTO subway_statistics values(630,'��ȭ(420)','2017-04-03','����',7,2679);
INSERT INTO subway_statistics values(631,'���빮(421)','2017-04-01','����',7,268);
INSERT INTO subway_statistics values(632,'���빮(421)','2017-04-01','����',7,1220);
INSERT INTO subway_statistics values(633,'���빮(421)','2017-04-02','����',7,92);
INSERT INTO subway_statistics values(634,'���빮(421)','2017-04-02','����',7,171);
INSERT INTO subway_statistics values(635,'���빮(421)','2017-04-03','����',7,245);
INSERT INTO subway_statistics values(636,'���빮(421)','2017-04-03','����',7,1924);
INSERT INTO subway_statistics values(1123,'�溹��(317)','2017-04-01','����',8,503);
INSERT INTO subway_statistics values(1124,'�溹��(317)','2017-04-01','����',8,1030);
INSERT INTO subway_statistics values(1131,'�ȱ�(318)','2017-04-02','����',8,203);
INSERT INTO subway_statistics values(1132,'�ȱ�(318)','2017-04-02','����',8,816);
INSERT INTO subway_statistics values(1193,'����͹̳�(329)','2017-04-03','����',8,2806);
INSERT INTO subway_statistics values(1194,'����͹̳�(329)','2017-04-03','����',8,2900);