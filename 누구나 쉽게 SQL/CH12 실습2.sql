-- ������ �м� �ǽ�
-- 12-8 ������ ���̺� ����
CREATE TABLE traffic_accident(
    year NUMBER,
    trans_type VARCHAR2(10),
    accident_num NUMBER,
    death_num NUMBER
);
ALTER TABLE traffic_accident
ADD CONSTRAINT traffic_pk PRIMARY KEY(year, trans_type);

-- 2000~2010�� ������ �Է�
insert into traffic_accident values(2000,'�ڵ���',290481,10236);
insert into traffic_accident values(2001,'�ڵ���',260579,8097);
insert into traffic_accident values(2002,'�ڵ���',231026,7222);
insert into traffic_accident values(2003,'�ڵ���',240832,7212);
insert into traffic_accident values(2004,'�ڵ���',220755,6563);
insert into traffic_accident values(2005,'�ڵ���',214171,6376);
insert into traffic_accident values(2006,'�ڵ���',213745,6327);
insert into traffic_accident values(2007,'�ڵ���',211662,6166);
insert into traffic_accident values(2008,'�ڵ���',215822,5870);
insert into traffic_accident values(2009,'�ڵ���',231990,5838);
insert into traffic_accident values(2010,'�ڵ���',226878,5505);

insert into traffic_accident values(2000,'ö��',640,252);
insert into traffic_accident values(2001,'ö��',571,245);
insert into traffic_accident values(2002,'ö��',599,265);
insert into traffic_accident values(2003,'ö��',743,503);
insert into traffic_accident values(2004,'ö��',596,243);
insert into traffic_accident values(2005,'ö��',386,201);
insert into traffic_accident values(2006,'ö��',329,171);
insert into traffic_accident values(2007,'ö��',429,192);
insert into traffic_accident values(2008,'ö��',408,159);
insert into traffic_accident values(2009,'ö��',382,161);
insert into traffic_accident values(2010,'ö��',317,135);

insert into traffic_accident values(2000,'����ö',48,28);
insert into traffic_accident values(2001,'����ö',60,40);
insert into traffic_accident values(2002,'����ö',56,36);
insert into traffic_accident values(2003,'����ö',103,256);
insert into traffic_accident values(2004,'����ö',88,51);
insert into traffic_accident values(2005,'����ö',92,55);
insert into traffic_accident values(2006,'����ö',79,44);
insert into traffic_accident values(2007,'����ö',83,59);
insert into traffic_accident values(2008,'����ö',63,39);
insert into traffic_accident values(2009,'����ö',60,34);
insert into traffic_accident values(2010,'����ö',17,9);

insert into traffic_accident values(2000,'����',634,149);
insert into traffic_accident values(2001,'����',610,174);
insert into traffic_accident values(2002,'����',557,185);
insert into traffic_accident values(2003,'����',531,119);
insert into traffic_accident values(2004,'����',804,205);
insert into traffic_accident values(2005,'����',658,186);
insert into traffic_accident values(2006,'����',657,134);
insert into traffic_accident values(2007,'����',566,136);
insert into traffic_accident values(2008,'����',948,116);
insert into traffic_accident values(2009,'����',1815,148);
insert into traffic_accident values(2010,'����',1627,170);

insert into traffic_accident values(2000,'�װ���',3,0);
insert into traffic_accident values(2001,'�װ���',5,9);
insert into traffic_accident values(2002,'�װ���',4,1);
insert into traffic_accident values(2003,'�װ���',5,1);
insert into traffic_accident values(2004,'�װ���',3,2);
insert into traffic_accident values(2005,'�װ���',10,5);
insert into traffic_accident values(2006,'�װ���',6,1);
insert into traffic_accident values(2007,'�װ���',8,4);
insert into traffic_accident values(2008,'�װ���',6,3);
insert into traffic_accident values(2009,'�װ���',13,14);
insert into traffic_accident values(2010,'�װ���',7,1);

-- 12-9 ����, ������ܺ� ���, ��� �Ǽ� ��ȸ
SELECT CASE WHEN year BETWEEN 2000 AND 2005 THEN '2000-2005��'
            WHEN year BETWEEN 2006 AND 2010 THEN '2006-2010��'
       END AS year_group,
       trans_type, SUM(accident_num) "���", SUM(death_num) "�����"
FROM traffic_accident
GROUP BY CASE WHEN year BETWEEN 2000 AND 2005 THEN '2000-2005��'
              WHEN year BETWEEN 2006 AND 2010 THEN '2006-2010��'
         END, trans_type
ORDER BY 1, 2;

-- 12-10 ������� �� ��� �Ǽ� ��ȸ
SELECT trans_type "�������",
       SUM(CASE WHEN year BETWEEN 2000 AND 2005 THEN accident_num ELSE 0 END)"2000-2005��",
       SUM(CASE WHEN year BETWEEN 2006 AND 2010 THEN accident_num ELSE 0 END)"2006-2010��"
FROM traffic_accident
GROUP BY trans_type
ORDER BY 1;

-- ������� �� �ִ� ����ڼ� ��ȸ
SELECT trans_type, MAX(death_num) AS death
FROM traffic_accident
GROUP BY trans_type;

-- 12-11 ������� �� ����� ���� ���� ���� ���� ��ȸ
--  ���������� �����;� �ϱ� ������ join ���
SELECT a.trans_type, a.year, b.death
FROM traffic_accident a,
     (SELECT trans_type, MAX(death_num) AS death FROM traffic_accident
      GROUP BY trans_type) b
WHERE a.trans_type=b.trans_type AND a.death_num=b.death;

-- ��������. ������ܺ� ��� �Ǽ� ��� ����� �� ������ ���
SELECT trans_type,
       ROUND(AVG(death_num/accident_num) * 100, 1) "�����/���"
FROM traffic_accident
WHERE accident_num>0
GROUP BY trans_type
ORDER BY 1;