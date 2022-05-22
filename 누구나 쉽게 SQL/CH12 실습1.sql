-- 로또 분석 실습
-- 12-1 로또 번호 테이블 생성
CREATE TABLE lotto_number(
    seq_no NUMBER PRIMARY KEY,
    draw_date DATE,
    num1 NUMBER,
    num2 NUMBER,
    num3 NUMBER,
    num4 NUMBER,
    num5 NUMBER,
    num6 NUMBER,
    bonus NUMBER
);

-- 12-2 로또 결과 테이블 생성
CREATE TABLE lotto_detail(
    seq_no NUMBER NOT NULL,
    rank_no NUMBER NOT NULL,
    win_person_no NUMBER,
    money NUMBER
);
ALTER TABLE lotto_detail
ADD CONSTRAINT result_pk PRIMARY KEY(seq_no, rank_no);

-- 로또 번호는 1~10회차, 로또 결과는 1~5회차 데이터 입력
insert into lotto_number values(1, TO_DATE('2002-12-07','YYYY-MM-DD'),10,23,29,33,37,40,16);
insert into lotto_number values(2, TO_DATE('2002-12-14','YYYY-MM-DD'),9,13,21,25,32,42,2);
insert into lotto_number values(3, TO_DATE('2002-12-21','YYYY-MM-DD'),11,16,19,21,27,31,30);
insert into lotto_number values(4, TO_DATE('2002-12-28','YYYY-MM-DD'),14,27,30,31,40,42,2);
insert into lotto_number values(5, TO_DATE('2003-01-04','YYYY-MM-DD'),16,24,29,40,41,42,3);
insert into lotto_number values(6, TO_DATE('2003-01-11','YYYY-MM-DD'),14,15,26,27,40,42,34);
insert into lotto_number values(7, TO_DATE('2003-01-18','YYYY-MM-DD'),2,9,16,25,26,40,42);
insert into lotto_number values(8, TO_DATE('2003-01-25','YYYY-MM-DD'),8,19,25,34,37,39,9);
insert into lotto_number values(9, TO_DATE('2003-02-01','YYYY-MM-DD'),2,4,16,17,36,39,14);
insert into lotto_number values(10, TO_DATE('2003-02-08','YYYY-MM-DD'),9,25,30,33,41,44,6);

insert into lotto_detail values(5,5,60434,5000);
insert into lotto_detail values(4,5,52382,5000);
insert into lotto_detail values(3,5,73256,5000);
insert into lotto_detail values(2,5,55480,5000);
insert into lotto_detail values(1,5,40155,5000);
insert into lotto_detail values(5,4,3043,50000);
insert into lotto_detail values(4,4,2777,50000);
insert into lotto_detail values(3,4,5940,50000);
insert into lotto_detail values(2,4,3763,50000);
insert into lotto_detail values(1,4,2537,50000);
insert into lotto_detail values(5,3,42,6033800);
insert into lotto_detail values(4,3,29,7282400);
insert into lotto_detail values(3,3,139,1174100);
insert into lotto_detail values(2,3,103,1842000);
insert into lotto_detail values(1,3,28,5140500);
insert into lotto_detail values(5,2,0,0);
insert into lotto_detail values(4,2,1,211191200);
insert into lotto_detail values(3,2,0,0);
insert into lotto_detail values(2,2,2,94866800);
insert into lotto_detail values(1,2,1,143934100);
insert into lotto_detail values(5,1,0,0);
insert into lotto_detail values(4,1,0,0);
insert into lotto_detail values(3,1,1,2000000000);
insert into lotto_detail values(2,1,1,2002006800);
insert into lotto_detail values(1,1,0,0);

-- 12-4 중복 번호 존재 조회
SELECT num1, num2, num3, num4, num5, num6, COUNT(*) FROM lotto_number
GROUP BY num1, num2, num3, num4, num5, num6
HAVING COUNT(*) > 1;

-- 12-5 num1기준 가장 많이 뽑힌 번호 조회
SELECT num1, COUNT(*) FROM lotto_number
GROUP BY num1
ORDER BY 2 DESC;

-- 12-6 가장 많이 뽑힌 번호 조회
--  서브쿼리만 실행해보면 컬럼별로 카운팅한 걸 모두 출력한거라 로또번호가 겹침
--  -> 결과를 메인에서 더해줘야 정확한 결과가 나옴
SELECT lotto_num, SUM(cnt) AS cnt
FROM(SELECT num1 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num1
         UNION ALL -- 결과 모두 출력(합집합)
     SELECT num2 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num2
         UNION ALL
     SELECT num3 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num3
         UNION ALL
     SELECT num4 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num4
         UNION ALL
     SELECT num5 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num5
         UNION ALL
     SELECT num6 lotto_num, COUNT(*) cnt FROM lotto_number
     GROUP BY num6)
GROUP BY lotto_num
ORDER BY 2 DESC;

-- 12-7 가장 많은 당첨금이 나온 회차와 번호, 금액 조회
SELECT n.seq_no AS "회차", d.money AS "당첨금", d.win_person_no AS "당첨인원",
       n.num1, n.num2, n.num3, n.num4, n.num5, n.num6, n.bonus
FROM lotto_number n, lotto_detail d
WHERE n.seq_no=d.seq_no AND d.rank_no=1
ORDER BY d.money DESC;