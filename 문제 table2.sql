/*  1. 운동부 TABLE을 작성하라
        - 테이블 생성
        TEAM : 팀번호, 팀명, 지역, 개설 날짜, 전화번호, 홈페이지
        PLAYER : 선수번호, 선수명, 등록일, 포지션, 키, 팀번호
        - 팀을 두 개 추가하고, 각각 선수 3명씩 추가
        - 선수의 팀명, 전화번호, 홈페이지 조회  */
-- 테이블 생성 
CREATE TABLE team(
    team_num NUMBER CONSTRAINT team_pk PRIMARY KEY,
    team_name VARCHAR2(50) NOT NULL,
    local_name VARCHAR2(10) NOT NULL,
    open_date DATE NOT NULL,
    tel VARCHAR2(20) NOT NULL,
    homepage VARCHAR2(50) NOT NULL
);

CREATE TABLE player(
    player_num NUMBER CONSTRAINT player_pk PRIMARY KEY,
    player_name VARCHAR2(20) NOT NULL,
    regi_date DATE NOT NULL,
    position VARCHAR2(10) NOT NULL,
    height NUMBER NOT NULL,
    team_num NUMBER NOT NULL
);

-- 외래키 생성
ALTER TABLE player ADD
CONSTRAINT player_fk FOREIGN KEY(team_num)
REFERENCES team(team_num);

-- 데이터 추가
INSERT INTO team
VALUES(100, '아자아자', '경기', '20201111', '02-123-123', 'www.aja.co.kr');
INSERT INTO team
VALUES(200, '파이팅', '서울', '20221010', '02-456-456', 'www.fighting.co.kr');

INSERT INTO player
VALUES(7, '너구리', '20201212', '공격', 181.3, 100);
INSERT INTO player
VALUES(15, '멍멍이', '20201215', '공격', 175.5, 100);
INSERT INTO player
VALUES(21, '코끼리', '20201215', '방어', 190, 100);

INSERT INTO player
VALUES(10, '장미', '20221030', '공격', 185, 200);
INSERT INTO player
VALUES(19, '민들레', '20221030', '공격', 168.9, 200);
INSERT INTO player
VALUES(24, '수국', '20221111', '방어', 187.3, 200);

-- 데이터 조회
SELECT t.team_name, p.player_name, t.tel, t.homepage
FROM player p, team t
WHERE p.team_num = t.team_num AND p.player_name = '장미';
        
/*  2. 온라인 마켓 TABLE을 작성하라
        - 테이블 생성
        PRODUCT(상품) : 상품번호, 상품명, 상품설명, 상품가격
        CONSUMER(소비자) : 소비자ID, 이름, 나이
        CART(장바구니) : 장바구니번호, 소비자ID, 상품번호, 수량
        - 상품 추가, 소비자 추가, 장바구니에 소비자가 쇼핑한 상품 추가
        - 쇼핑한 상품 조회  */
-- 테이블 생성
CREATE TABLE product(
    product_num NUMBER CONSTRAINT product_pk PRIMARY KEY,
    product_name VARCHAR2(20) NOT NULL,
    product_memo VARCHAR2(100),
    price number NOT NULL
);

CREATE TABLE consumer(
    consumer_id VARCHAR2(20) CONSTRAINT consumer_pk PRIMARY KEY,
    consumer_name VARCHAR2(20) NOT NULL,
    age NUMBER
);

CREATE TABLE cart(
    cart_num NUMBER CONSTRAINT cart_pk PRIMARY KEY,
    consumer_id VARCHAR2(20) NOT NULL,
    product_num NUMBER NOT NULL,
    amount NUMBER NOT NULL
);

-- 외래키 생성
ALTER TABLE cart ADD
CONSTRAINT cart_fk_consumer FOREIGN KEY(consumer_id)
REFERENCES consumer(consumer_id);

ALTER TABLE cart ADD
CONSTRAINT cart_fk_product FOREIGN KEY(product_num)
REFERENCES product(product_num);

-- 데이터 추가
INSERT INTO product
VALUES(10801, '연필', '메모하거나 그림그릴 때 사용', 800);
INSERT INTO product
VALUES(45698, '지우개', '연필로 작성한 것을 지워줌', 500);
INSERT INTO product
VALUES(11865, '필통', '필기구를 담는 곳', 5000);
INSERT INTO product
VALUES(25987, '크레파스', '스케치북에 그림그릴 때 사용', 8000);
INSERT INTO product
VALUES(78513, '공책', '메모나 필기하는 공간', 1000);

INSERT INTO consumer
VALUES('heizeeee', '헤이즈', 30);
INSERT INTO consumer
VALUES('taeyeon77', '태연', 35);

INSERT INTO cart
VALUES(1, 'heizeeee', 10801, 5);
INSERT INTO cart
VALUES(2, 'heizeeee', 11865, 1);
INSERT INTO cart
VALUES(3, 'taeyeon77', 25987,2);

-- 데이터 조회
SELECT c.consumer_id, c.product_num, p.product_name, p.price
FROM cart c, product p
WHERE c.product_num = p.product_num AND c.consumer_id = 'heizeeee';