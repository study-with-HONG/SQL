-- ����� �̼����� �м� �ǽ�
-- 12-12 �̼����� ������ ���̺� ����
CREATE TABLE fine_dust(
    gu VARCHAR2(30),
    mea_station VARCHAR2(30),
    mea_date DATE,
    pm10 NUMBER,    -- �̼�������
    pm25 NUMBER     -- �ʹ̼�������, ������ pm2.5
);
ALTER TABLE fine_dust
ADD CONSTRAINTS dust_pk PRIMARY KEY(gu, mea_station, mea_date);

-- 12-13 �̼����� ���� ���̺� ����
CREATE TABLE fine_dust_standard(
    org_name VARCHAR2(30),
    std_name VARCHAR2(30),
    pm10_start NUMBER,
    pm10_end NUMBER,
    pm25_start NUMBER,
    pm25_end NUMBER
);
ALTER TABLE fine_dust_standard
ADD CONSTRAINTS std_pk PRIMARY KEY(org_name, std_name);

-- �ǽ� ������ �Է�, ������ �����ʹ� ��ġ,���� �������� 1~5�� ���� 10���� �Է�
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-16','yyyy-mm-dd'),51,23);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-17','yyyy-mm-dd'),73,34);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-18','yyyy-mm-dd'),103,58);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-19','yyyy-mm-dd'),109,62);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-20','yyyy-mm-dd'),60,33);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-21','yyyy-mm-dd'),46,26);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-22','yyyy-mm-dd'),81,25);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-23','yyyy-mm-dd'),46,29);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-24','yyyy-mm-dd'),37,22);
insert into fine_dust values('���� ���ʱ�','���ʱ�',to_date('2017-01-25','yyyy-mm-dd'),47,29);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-04','yyyy-mm-dd'),106,70);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-05','yyyy-mm-dd'),71,50);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-06','yyyy-mm-dd'),40,25);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-07','yyyy-mm-dd'),40,21);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-08','yyyy-mm-dd'),53,28);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-09','yyyy-mm-dd'),52,19);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-10','yyyy-mm-dd'),33,17);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-11','yyyy-mm-dd'),29,17);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-12','yyyy-mm-dd'),33,18);
insert into fine_dust values('���� ���α�','���α�',to_date('2017-02-13','yyyy-mm-dd'),47,29);
insert into fine_dust values('���� ������','������',to_date('2018-03-04','yyyy-mm-dd'),31,17);
insert into fine_dust values('���� ������','������',to_date('2018-03-05','yyyy-mm-dd'),9,6);
insert into fine_dust values('���� ������','������',to_date('2018-03-06','yyyy-mm-dd'),34,19);
insert into fine_dust values('���� ������','������',to_date('2018-03-07','yyyy-mm-dd'),29,16);
insert into fine_dust values('���� ������','������',to_date('2018-03-08','yyyy-mm-dd'),32,29);
insert into fine_dust values('���� ������','������',to_date('2018-03-09','yyyy-mm-dd'),48,33);
insert into fine_dust values('���� ������','������',to_date('2018-03-10','yyyy-mm-dd'),51,33);
insert into fine_dust values('���� ������','������',to_date('2018-03-11','yyyy-mm-dd'),65,39);
insert into fine_dust values('���� ������','������',to_date('2018-03-12','yyyy-mm-dd'),93,52);
insert into fine_dust values('���� ������','������',to_date('2018-03-13','yyyy-mm-dd'),71,38);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-02','yyyy-mm-dd'),42,37);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-03','yyyy-mm-dd'),80,59);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-04','yyyy-mm-dd'),77,57);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-05','yyyy-mm-dd'),56,45);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-06','yyyy-mm-dd'),23,16);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-07','yyyy-mm-dd'),33,20);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-08','yyyy-mm-dd'),55,37);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-09','yyyy-mm-dd'),43,28);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-10','yyyy-mm-dd'),25,15);
insert into fine_dust values('���� ���ϱ�','���ϱ�',to_date('2017-04-11','yyyy-mm-dd'),53,21);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-09','yyyy-mm-dd'),111,32);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-10','yyyy-mm-dd'),47,21);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-11','yyyy-mm-dd'),77,34);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-12','yyyy-mm-dd'),77,41);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-13','yyyy-mm-dd'),55,27);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-14','yyyy-mm-dd'),58,16);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-15','yyyy-mm-dd'),45,14);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-16','yyyy-mm-dd'),39,17);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-17','yyyy-mm-dd'),46,24);
insert into fine_dust values('���� ���Ǳ�','���Ǳ�',to_date('2017-05-18','yyyy-mm-dd'),52,30);

insert into fine_dust_standard values ('WHO', '����', 0, 30, 0, 15);
insert into fine_dust_standard values ('WHO', '����', 31, 50, 16, 25);
insert into fine_dust_standard values ('WHO', '����', 51, 70, 26, 35);
insert into fine_dust_standard values ('WHO', '�ſ쳪��', 71, 999, 36, 999);

-- 12-14 ���� �̼����� �ּ�, �ִ�, ��հ�
SELECT TO_CHAR(mea_date, 'yyyy-mm') AS "date",
       MIN(pm10) AS min, MAX(pm10) AS max, AVG(pm10) AS avg
FROM fine_dust
WHERE pm10>0
GROUP BY TO_CHAR(mea_date, 'yyyy-mm')
ORDER BY 1;

-- 12-15 ����� �̼����� ����
SELECT a.months,
       a.pm10_avg,
       (SELECT s.std_name FROM fine_dust_standard s
        WHERE a.pm10_avg BETWEEN s.pm10_start AND s.pm10_end) �̼�����,
       a.pm25_avg,
       (SELECT s.std_name FROM fine_dust_standard s
        WHERE a.pm25_avg BETWEEN s.pm25_start AND s.pm25_end) �ʹ̼�����
FROM (SELECT TO_CHAR(mea_date, 'yyyy-mm') months,
             ROUND(AVG(pm10), 0) pm10_avg,
             ROUND(AVG(pm25), 0) pm25_avg
      FROM fine_dust
      WHERE pm10>0 AND pm25>0
      GROUP BY TO_CHAR(mea_date, 'yyyy-mm')) a
ORDER BY 1;

-- ��������. �̼����� ��հ��� �̼����� ���º� �ϼ� ��ȸ
SELECT std_name,COUNT(*)
FROM (SELECT d.std_name, i.days, i.pm10_avg,
             d.pm10_start, d.pm10_end
     FROM fine_dust_standard d,
          (SELECT TO_CHAR(mea_date, 'YYYY-MM-DD') days,
                  ROUND(AVG(pm10),0) pm10_avg
           FROM fine_dust
           GROUP BY  TO_CHAR(mea_date, 'YYYY-MM-DD')) i
     WHERE d.org_name = 'WHO'
           AND i.pm10_avg BETWEEN d.pm10_start 
                              AND d.pm10_end)
GROUP BY std_name; 