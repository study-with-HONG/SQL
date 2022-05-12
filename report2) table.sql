DROP TABLE ���̺�� CASCADE CONSTRAINTS;
-- 1. ��� TABLE�� �ۼ��϶�
--  TEAM : ����ȣ, ����, ����, ���� ��¥, ��ȭ��ȣ, Ȩ������
--  PLAYER : ������ȣ, ������, �����, ������, Ű, ����ȣ
--  ���� �� �� �߰��ϰ�, ���� ���� 3�� �߰�
--*****  ������ �Է��� �� �� ������ ����, ��ȭ��ȣ, Ȩ������ ���
CREATE TABLE team(
    team_num NUMBER CONSTRAINT team_pk PRIMARY KEY,
    team_name VARCHAR2(20) NOT NULL,
    local_name VARCHAR2(10) NOT NULL,
    open_date DATE NOT NULL,
    team_callnum VARCHAR2(20) NOT NULL,
    homepage VARCHAR2(30) NOT NULL
);

CREATE TABLE player(
    player_num NUMBER CONSTRAINT player_pk PRIMARY KEY,
    player_name VARCHAR2(10) NOT NULL,
    regi_date DATE NOT NULL,
    player_position VARCHAR2(10) NOT NULL,
    height NUMBER NOT NULL,
    team_num NUMBER NOT NULL
);

ALTER TABLE player ADD
CONSTRAINT player_fk FOREIGN KEY(team_num)
REFERENCES team(team_num);

INSERT INTO team
VALUES(100, '���ھ���', '���', '20201111', '02-123-123', 'www.aja.co.kr');
INSERT INTO team
VALUES(200, '������', '����', '20221010', '02-456-456', 'www.haha.co.kr');

INSERT INTO player
VALUES(7, '�ʱ���', '20201212', '����', 181.3, 100);
INSERT INTO player
VALUES(15, '�۸���', '20201215', '����', 175.5, 100);
INSERT INTO player
VALUES(21, '�ڳ���', '20201215', '���', 190, 100);

INSERT INTO player
VALUES(10, '���', '20221030', '����', 185, 200);
INSERT INTO player
VALUES(19, '�ε鷹', '20221030', '����', 168.9, 200);
INSERT INTO player
VALUES(24, '����', '20221111', '���', 187.3, 200);



-- 2. �¶��� ���� TABLE�� �ۼ��϶�
--  PRODUCT(��ǰ) : ��ǰ��ȣ, ��ǰ��, ��ǰ����, ��ǰ����
--  CONSUMER(�Һ���) : �Һ���ID, �̸�, ����
--  CART(��ٱ���) : ��ٱ��Ϲ�ȣ, �Һ���ID, ��ǰ��ȣ, ����
--  ��ǰ �߰�, �Һ��� �߰�, ��ٱ��Ͽ� �Һ��ڰ� ������ ��ǰ �߰�
--*****   �Һ��ڰ� ������ ��ǰ ���
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
    product_count NUMBER NOT NULL
);

ALTER TABLE cart ADD
CONSTRAINT cart_fk_consumer FOREIGN KEY(consumer_id)
REFERENCES consumer(consumer_id);

ALTER TABLE cart ADD
CONSTRAINT cart_fk_product FOREIGN KEY(product_num)
REFERENCES product(product_num);

INSERT INTO product
VALUES(10801, '����', '�޸��ϰų� �׸��׸� �� ���', 800);
INSERT INTO product
VALUES(45698, '���찳', '���ʷ� �ۼ��� ���� ������', 500);
INSERT INTO product
VALUES(11865, '����', '�ʱⱸ�� ��� ��', 5000);
INSERT INTO product
VALUES(25987, 'ũ���Ľ�', '����ġ�Ͽ� �׸��׸� �� ���', 8000);
INSERT INTO product
VALUES(78513, '��å', '�޸� �ʱ��ϴ� ����', 1000);

INSERT INTO consumer
VALUES('heizeeee', '������', 30);
INSERT INTO consumer
VALUES('taeyeon77', '�¿�', 35);

INSERT INTO cart
VALUES(1, 'heizeeee', 10801, 5);
INSERT INTO cart
VALUES(2, 'heizeeee', 11865, 1);
INSERT INTO cart
VALUES(3, 'taeyeon77', 25987,2);