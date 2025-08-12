CREATE TABLE cart (
    cartno        NUMBER NOT NULL,
    userid        VARCHAR2(20 BYTE) NOT NULL,
    prodno        NUMBER(6) NOT NULL,
    cartprodcount NUMBER NOT NULL,
    cartproddate  DATE
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartno );

CREATE TABLE category (
    cateno   NUMBER(2) NOT NULL,
    catename VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( cateno );

CREATE TABLE orders (
    orderno         CHAR(11) NOT NULL,
    userid          VARCHAR2(20 BYTE) NOT NULL,
    ordertotalprice NUMBER NOT NULL,
    orderaddress    VARCHAR2(200 BYTE) NOT NULL,
    orderstatus     NUMBER,
    orderdate       DATE NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE ordersitem (
    itemno       NUMBER NOT NULL,
    orderno      CHAR(11) NOT NULL,
    prodno       NUMBER(6) NOT NULL,
    itemprice    NUMBER NOT NULL,
    itemdiscount NUMBER NOT NULL,
    itemcount    NUMBER
);

ALTER TABLE ordersitem ADD CONSTRAINT ordersltem_pk PRIMARY KEY ( itemno );

CREATE TABLE point (
    pointno   NUMBER NOT NULL,
    userid    VARCHAR2(20 BYTE) NOT NULL,
    point     NUMBER NOT NULL,
    "desc"    VARCHAR2(100 BYTE) NOT NULL,
    pointdate DATE NOT NULL
);

ALTER TABLE point ADD CONSTRAINT point_pk PRIMARY KEY ( pointno );

CREATE TABLE product (
    prodno       NUMBER(6) NOT NULL,
    cateno       NUMBER(2) NOT NULL,
    prodname     VARCHAR2(20 BYTE) NOT NULL,
    prodprice    NUMBER NOT NULL,
    prodstock    NUMBER,
    prodsold     NUMBER,
    proddiscount NUMBER,
    sellerno     NUMBER(5)
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

CREATE TABLE seller (
    sellerno NUMBER(5) NOT NULL,
    company  VARCHAR2(100 BYTE) NOT NULL,
    tel      VARCHAR2(20 BYTE) NOT NULL,
    manager  VARCHAR2(20 BYTE) NOT NULL,
    address  VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE seller ADD CONSTRAINT seller_pk PRIMARY KEY ( sellerno );

CREATE TABLE "User" (
    userid  VARCHAR2(20 BYTE) NOT NULL,
    name    VARCHAR2(20 BYTE) NOT NULL,
    birth   CHAR(10) NOT NULL,
    gender  CHAR(1) NOT NULL,
    hp      CHAR(13) NOT NULL,
    email   VARCHAR2(100),
    point   NUMBER,
    "level" NUMBER,
    address VARCHAR2(100 BYTE),
    regdate DATE NOT NULL
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( userid );

ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE cart
    ADD CONSTRAINT cart_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersltem_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersltem_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE point
    ADD CONSTRAINT point_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE product
    ADD CONSTRAINT product_category_fk FOREIGN KEY ( cateno )
        REFERENCES category ( cateno );

ALTER TABLE product
    ADD CONSTRAINT product_seller_fk FOREIGN KEY ( sellerno )
        REFERENCES seller ( sellerno );

// 데이터 입력
ALTER TABLE Product MODIFY prodName VARCHAR2(100);

// User
insert into "User" values('user1','김유신','1976-01-21','M','010-1101-1976','kimys@naver.com', 0, 1,'서울', SYSDATE);
insert into "User" values('user2','계백','1975-06-11','M','010-1102-1975',null, 1000, 1,'서울', SYSDATE);
insert into "User" values('user3','김춘추','1989-05-30','M','010-1103-1989',null, 1200, 2,'서울', SYSDATE);
insert into "User" values('user4','이사부','1979-04-13','M','010-2101-1979','leesabu@gmail.com', 2600, 1,'서울', SYSDATE);
insert into "User" values('user5','장보고','1966-09-12','M','010-2104-1966','jangbg@naver.com',9400 ,4 ,'대전', SYSDATE);
insert into "User" values('user6','선덕여왕','1979-07-28','F','010-3101-1979','gueen@naver.com',1600 ,2 ,'대전', SYSDATE);
insert into "User" values('user7','강감찬','1984-06-15','M','010-4101-1984','kang@daum.net',800 ,0 ,'대구', SYSDATE);
insert into "User" values('user8','신사임당','1965-10-21','F','010-5101-1965','sinsa@gmail.com',1500 ,1 ,'대구', SYSDATE);
insert into "User" values('user9','이이','1972-11-28','M','010-6101-1972','leelee@nete.com',3400 ,3 ,'부산', SYSDATE);
insert into "User" values('user10','허난설헌','1992-09-07','F','010-7103-1992',null, 4100, 3,'광주', SYSDATE);

// Point
insert into Point values(1, 'user1', 1000 , '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into Point values(2, 'user1', 6000, '상품구매 5% 적립','2022-01-10 10:50:12');
insert into Point values(3, 'user3', 2835, '상품구매 5% 적립','2022-01-10 10:50:12');
insert into Point values(4, 'user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values(5, 'user5', 3000, '이벤트 응모 3000 적립', '2022-01-10 10:50:12');
insert into Point values(6, 'user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into Point values(7, 'user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12');
insert into Point values(8, 'user2', 2615, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values(9, 'user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12');
insert into Point values(10, 'user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');

// Sellers
insert into Seller values(10001, '(주)다팔아', '02-201-1976', '정우성', '서울');
insert into Seller values(10002, '판매의민족', '02-102-1975', '이정재', '서울');

insert into Seller values( 10003, '멋남', '031-103-1989', '원빈', '경기');
insert into Seller values( 10004, '스타일살아', '032-201-1979', '이나영', '경기');
insert into Seller values( 10005, '(주)삼성전자', '02-214-1966', '장동건', '서울');
insert into Seller values( 10006, '복실이옷짱', '051-301-1979', '고소영', '부산');
insert into Seller values( 10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구');
insert into Seller values( 10008, '(주)LG전자', '02-511-1965', '강호동', '서울');
insert into Seller values( 10009, '굿바디스포츠', '080-6101-1972', '조인성', '부산');
insert into Seller values( 10010, '누리푸드', '051-710-1992', '강동원', '부산');

--Category
insert into category values( 10, '여성의류패션');
insert into category values( 11, '남성의류패션');
insert into category values( 12, '식품·생필품');
insert into category values( 13, '취미·반려견');
insert into category values( 14, '홈·문구');
insert into category values( 15, '자동차·공구');
insert into category values( 16, '스포츠·건강');
insert into category values( 17, '컴퓨터·가전·디지털');
insert into category values( 18, '여행');
insert into category values( 19, '도서');

// Product
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 100101, 11,10003, '반팔티 L~2XL', 869 , 25000, 132, 20);
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 100110, 10,10004, '트레이닝 통바지', 1602, 38000,398 ,15 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 110101, 10,10003, '신상 여성운동화', 160, 76000, 40, 5);
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 120101, 12,10010, '암소 1등급 구이셋트 1.2kg', 0, 150000, 87,15 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 120103, 12,10010, '바로구이 부채살 250g', 0, 21000,61 ,10 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 130101, 13,10006, '[ANF] 식스프리 강아지 사료', 58, 56000,142 ,0 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 130112, 13,10006, '중대형 사계절 강아지옷', 120, 15000, 80,0 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 141001, 14,10001, '라떼 2인 소피/방수 패브릭', 0, 320000, 42,0 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 170115, 17,10007, '지포스 3080 그래픽 카드', 28, 900000, 12,12 );
insert into product (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice, prodSold, prodDiscount) values( 160103, 16,10009, '치닝디핑 33BR 철봉', 32, 120000,28 ,0 );

--Order
insert into Orders values('22010210001', 'user2', 52300, '서울시 마포구 121', 1, SYSDATE);
insert into Orders values('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, SYSDATE);
insert into Orders values('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38',2 , SYSDATE);
insert into Orders values('22010310001', 'user5', 127000, '경기도 광주시 초월로 21',1 , SYSDATE);
insert into Orders values('22010310100', 'user1', 120000, '경기도 수원시 120번지',0 , SYSDATE);
insert into Orders values('22010410101', 'user6', 792000, '부산시 남구 21-1',2 , SYSDATE);
insert into Orders values('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, SYSDATE);
insert into Orders values('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, SYSDATE);
insert into Orders values('22010510031', 'user10', 792000, '대전시 한밭로 24-1',2 , SYSDATE);
insert into Orders values('22010710110', 'user9', 94500, '광주시 충열로 11', 1, SYSDATE);

// OrderItems
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010210001', 100110 , 38000, 15, 1);
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010210001' ,100101 , 25000, 20, 1);
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010210002' ,120103 , 21000, 10,3 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010310001' ,130112 , 15000, 0,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010310001' ,130101 , 56000, 0,2 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010210010' ,110101 , 76000, 5, 1);
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010310100' ,160103 , 120000, 0,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010410101' ,170115 , 900000, 12 ,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010510021' ,110101 , 76000, 5,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010510027' ,130101 , 56000, 0,2 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010510021' ,100101 , 25000, 20,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010510031' ,170115 , 900000, 12,1 );
insert into OrdersItem (orderNo, prodNo,  itemPrice, itemDiscount, itemCount) values('22010710110' ,120103 , 21000, 10,5 );

// Carts
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user1', 100101, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user1', 100110, 2, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user3', 120103, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user4', 130112, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user5', 130101, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user2', 110101, 3, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user2', 160103, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user2', 170115, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user3', 110101, 1, SYSDATE);
insert into Cart (userid, prodNo, cartProdCount, cartProdDate) values('user6', 130101, 1, SYSDATE);

-- SQL 문제
--문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
SELECT 
	name,
	prodName,
	cartProdCount
FROM Cart a
JOIN "User" b ON a.userId = b.userId
JOIN Product c ON a.prodNo = c.prodNo
WHERE cartProdCount >= 2;


--문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
SELECT 
	prodNo,
	cateName,
	prodName,
	prodPrice,
	manager,
	tel
FROM Product a
JOIN Category b ON a.cateNo = b.cateNo
JOIN Seller c ON a.sellerNo = c.sellerNo;

--문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
SELECT 
    a.userId,
    a.name,
    a.hp,
    a.point,
    NVL(SUM(b.point), 0) AS 적립포인트_총합
FROM "User" a
LEFT JOIN Point b ON a.userId = b.userId
GROUP BY a.userId, a.name, a.hp, a.point;

--문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오.
--       단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
SELECT
	a.orderNo,
	a.userId,
	b.name,
	a.orderTotalPrice,
	a.orderDate 
FROM Orders a
JOIN "User" b ON a.userId = b.userId
WHERE orderTotalPrice >= 100000
ORDER BY orderTotalPrice DESC, b.name ASC;

--문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 주문번호는 중복없이 상품명은 구분자 ,로 나열할것
SELECT
    a.orderNo,
    MAX(c.userId) AS userId,
    MAX(c.name) AS userName,
    LISTAGG(d.prodName, ',') WITHIN GROUP (ORDER BY d.prodName) AS 상품명,
    MAX(a.orderDate) AS orderDate
FROM Orders a
JOIN OrdersItem b ON a.orderNo = b.orderNo
JOIN "User" c ON a.userId = c.userId
JOIN Product d ON b.prodNo = d.prodNo
GROUP BY a.orderNo;




--문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
SELECT 
	prodNo,
	prodName,
	prodPrice,
	prodDiscount,
	FLOOR(prodPrice * (1 - prodDiscount / 100)) AS 할인가
FROM Product a;

--문제7. 고소영 판매자가 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오.
SELECT 
	a.prodNo,
	a.prodName,
	a.prodPrice,
	a.prodStock,
	b.manager
FROM Product a
JOIN Seller b ON a.sellerNo=b.sellerNo
WHERE b.manager='고소영';


--문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회하시오.
SELECT 
	a.sellerNo,
	a.company,
	a.manager,
	a.tel
FROM Seller a
LEFT JOIN Product b ON a.sellerNo = b.sellerNo
WHERE prodNo IS NULL;


--문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고 그 가격으로
--       주문별 총합을 구해서 주문별 총합이 10만원이상 그리고 큰 금액 순으로 주문번호, 최종총합을 조회하시오. 
SELECT 
    orderNo,
    SUM(할인가 * itemCount) AS 최종총합
FROM (
    SELECT 
        orderNo,
        itemPrice,
        itemDiscount,
        itemCount,
        FLOOR(itemPrice * (1 - itemDiscount / 100) * itemCount) AS 할인가
    FROM OrdersItem
) a
GROUP BY orderNo
HAVING SUM(할인가 * itemCount) >= 100000
ORDER BY SUM(할인가 * itemCount) DESC;



--문제10. 장보고 고객이 주문했던 모든 상품명을 고객명, 상품명으로 조회하시오. 
--        단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
SELECT 
    b.name,
    LISTAGG(d.prodName, ',') WITHIN GROUP (ORDER BY d.prodName) AS 상품목록
FROM Orders a
JOIN "User" b ON a.userId = b.userId
JOIN OrdersItem c ON a.orderNo = c.orderNo
JOIN Product d ON d.prodNo = c.prodNo
WHERE b.name = '장보고'
GROUP BY b.name;