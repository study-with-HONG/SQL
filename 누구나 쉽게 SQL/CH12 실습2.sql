-- 교통사고 분석 실습
-- 12-8 교통사고 테이블 생성
CREATE TABLE traffic_accident(
    year NUMBER,
    trans_type VARCHAR2(10),
    accident_num NUMBER,
    death_num NUMBER
);
ALTER TABLE traffic_accident
ADD CONSTRAINT traffic_pk PRIMARY KEY(year, trans_type);

-- 2000~2010년 데이터 입력
insert into traffic_accident values(2000,'자동차',290481,10236);
insert into traffic_accident values(2001,'자동차',260579,8097);
insert into traffic_accident values(2002,'자동차',231026,7222);
insert into traffic_accident values(2003,'자동차',240832,7212);
insert into traffic_accident values(2004,'자동차',220755,6563);
insert into traffic_accident values(2005,'자동차',214171,6376);
insert into traffic_accident values(2006,'자동차',213745,6327);
insert into traffic_accident values(2007,'자동차',211662,6166);
insert into traffic_accident values(2008,'자동차',215822,5870);
insert into traffic_accident values(2009,'자동차',231990,5838);
insert into traffic_accident values(2010,'자동차',226878,5505);

insert into traffic_accident values(2000,'철도',640,252);
insert into traffic_accident values(2001,'철도',571,245);
insert into traffic_accident values(2002,'철도',599,265);
insert into traffic_accident values(2003,'철도',743,503);
insert into traffic_accident values(2004,'철도',596,243);
insert into traffic_accident values(2005,'철도',386,201);
insert into traffic_accident values(2006,'철도',329,171);
insert into traffic_accident values(2007,'철도',429,192);
insert into traffic_accident values(2008,'철도',408,159);
insert into traffic_accident values(2009,'철도',382,161);
insert into traffic_accident values(2010,'철도',317,135);

insert into traffic_accident values(2000,'지하철',48,28);
insert into traffic_accident values(2001,'지하철',60,40);
insert into traffic_accident values(2002,'지하철',56,36);
insert into traffic_accident values(2003,'지하철',103,256);
insert into traffic_accident values(2004,'지하철',88,51);
insert into traffic_accident values(2005,'지하철',92,55);
insert into traffic_accident values(2006,'지하철',79,44);
insert into traffic_accident values(2007,'지하철',83,59);
insert into traffic_accident values(2008,'지하철',63,39);
insert into traffic_accident values(2009,'지하철',60,34);
insert into traffic_accident values(2010,'지하철',17,9);

insert into traffic_accident values(2000,'선박',634,149);
insert into traffic_accident values(2001,'선박',610,174);
insert into traffic_accident values(2002,'선박',557,185);
insert into traffic_accident values(2003,'선박',531,119);
insert into traffic_accident values(2004,'선박',804,205);
insert into traffic_accident values(2005,'선박',658,186);
insert into traffic_accident values(2006,'선박',657,134);
insert into traffic_accident values(2007,'선박',566,136);
insert into traffic_accident values(2008,'선박',948,116);
insert into traffic_accident values(2009,'선박',1815,148);
insert into traffic_accident values(2010,'선박',1627,170);

insert into traffic_accident values(2000,'항공기',3,0);
insert into traffic_accident values(2001,'항공기',5,9);
insert into traffic_accident values(2002,'항공기',4,1);
insert into traffic_accident values(2003,'항공기',5,1);
insert into traffic_accident values(2004,'항공기',3,2);
insert into traffic_accident values(2005,'항공기',10,5);
insert into traffic_accident values(2006,'항공기',6,1);
insert into traffic_accident values(2007,'항공기',8,4);
insert into traffic_accident values(2008,'항공기',6,3);
insert into traffic_accident values(2009,'항공기',13,14);
insert into traffic_accident values(2010,'항공기',7,1);

-- 12-9 연도, 교통수단별 사고, 사망 건수 조회
SELECT CASE WHEN year BETWEEN 2000 AND 2005 THEN '2000-2005년'
            WHEN year BETWEEN 2006 AND 2010 THEN '2006-2010년'
       END AS year_group,
       trans_type, SUM(accident_num) "사고", SUM(death_num) "사망자"
FROM traffic_accident
GROUP BY CASE WHEN year BETWEEN 2000 AND 2005 THEN '2000-2005년'
              WHEN year BETWEEN 2006 AND 2010 THEN '2006-2010년'
         END, trans_type
ORDER BY 1, 2;

-- 12-10 교통수단 별 사고 건수 조회
SELECT trans_type "교통수단",
       SUM(CASE WHEN year BETWEEN 2000 AND 2005 THEN accident_num ELSE 0 END)"2000-2005년",
       SUM(CASE WHEN year BETWEEN 2006 AND 2010 THEN accident_num ELSE 0 END)"2006-2010년"
FROM traffic_accident
GROUP BY trans_type
ORDER BY 1;

-- 교통수단 별 최대 사망자수 조회
SELECT trans_type, MAX(death_num) AS death
FROM traffic_accident
GROUP BY trans_type;

-- 12-11 교통수단 별 사망자 수가 가장 많은 연도 조회
--  연도정보를 가져와야 하기 때문에 join 사용
SELECT a.trans_type, a.year, b.death
FROM traffic_accident a,
     (SELECT trans_type, MAX(death_num) AS death FROM traffic_accident
      GROUP BY trans_type) b
WHERE a.trans_type=b.trans_type AND a.death_num=b.death;

-- 연습문제. 교통수단별 사고 건수 대비 사망자 수 비율의 평균
SELECT trans_type,
       ROUND(AVG(death_num/accident_num) * 100, 1) "사망자/사고"
FROM traffic_accident
WHERE accident_num>0
GROUP BY trans_type
ORDER BY 1;