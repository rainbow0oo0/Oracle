/*
    날짜 : 2025/08/13
    이름 : 이준우
    내용 : SQL 수행평가
*/

-- account 테이블 생성
CREATE TABLE account (
    acc_id            CHAR(14) NOT NULL,
    cust_jumin1       CHAR(14),
    acc_type          VARCHAR2(20) NOT NULL,
    acc_balance       NUMBER NOT NULL,
    acc_card          CHAR(1) NOT NULL,
    acc_register_date DATE
);

ALTER TABLE account ADD CONSTRAINT table_3_pk PRIMARY KEY ( acc_id );

-- card 테이블 생성
CREATE TABLE card (
    card_no            CHAR(14) NOT NULL,
    cust_jumin         CHAR(14),
    acc_id             CHAR(14),
    card_ragister_date DATE,
    card_limit         NUMBER,
    card_approve_date  DATE,
    card_type          VARCHAR2(10) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_no );

-- customer 테이블 생성
CREATE TABLE customer (
    cust_jumin CHAR(14) NOT NULL,
    name       VARCHAR2(20) NOT NULL,
    address    VARCHAR2(100) NOT NULL,
    birth      CHAR(10) NOT NULL,
    email      VARCHAR2(100),
    hp         VARCHAR2(20) NOT NULL,
    job        VARCHAR2(20)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_jumin );

-- transaction 테이블 생성
CREATE TABLE transaction (
    trans_id      NUMBER NOT NULL,
    trans_acc_id  CHAR(14) NOT NULL,
    trans_type    VARCHAR2(14),
    trans_message VARCHAR2(20),
    trans_date    DATE NOT NULL
);

-- 시퀀스 추가
CREATE SEQUENCE trans_id_seq START WITH 1 INCREMENT BY 1 NOCACHE;

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( trans_id );

ALTER TABLE account
    ADD CONSTRAINT account_customer_fk FOREIGN KEY ( cust_jumin1 )
        REFERENCES customer ( cust_jumin );

ALTER TABLE card
    ADD CONSTRAINT card_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

ALTER TABLE card
    ADD CONSTRAINT card_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_fk FOREIGN KEY ( trans_acc_id )
        REFERENCES account ( acc_id );




/////////////////////////////////////////////////////////////////////////////

-- customer
select * from customer;
insert into customer values('760121-1234567', '정우성', '서울', '1976-01-21', null, '010-1101-7601', '배우');
insert into customer values('750611-1234567', '이정재', '서울', '1975-06-11', null, '010-1102-7506', '배우');
insert into customer values('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업');
insert into customer values('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '회사원');
insert into customer values('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');

-- Card
select * from card;
insert into card values('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check');
insert into card values('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check');
insert into card values('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check');
insert into card values('2611-1001-1005', '750611-1234567', '1011-1002-1005', '2020-09-12', 1500000, '2020-10-10', 'check');

-- Account
select * from account;
insert into account values('1011-1001-1001', '760121-1234567', '자유입출금', '4160000', 'Y', '2020-01-21 13:00:02');
insert into account values('1011-1001-1002', '890530-1234567', '자유입출금', '376000', 'Y', '2020-06-11 13:00:02');
insert into account values('1011-1001-1003', '790413-1234567', '자유입출금', '120000', 'Y', '2020-05-30 13:00:02');
insert into account values('1011-2001-1004', '660912-1234567', '정기적금', '1000000', 'N', '2020-04-13 13:00:02');
insert into account values('1011-1002-1005', '750611-1234567', '자유입출금', '820000', 'Y', '2020-09-12 13:00:02');

// 금액 실수로 120,000로 기입해서 1,080,000 추가
// update account set acc_balance = acc_balance + 1080000 where acc_id = '1011-1001-1003';

-- Transaction
select * from transaction;
insert into transaction values(1, '1011-1001-1001', '입금', '2월 정기급여',  '2020-02-10 12:36:12');
insert into transaction values(2, '1011-1001-1003', '출금', 'ATM 출금', '2020-02-10 12:37:12');
insert into transaction values(3, '1011-1001-1002', '입금', '2월 급여', '2020-02-10 12:38:12');
insert into transaction values(4, '1011-1001-1001', '출금', '2월 공과금', '2020-02-10 12:39:12');
insert into transaction values(5, '1011-1002-1005', '출금', 'ATM 출금', '2020-02-10 12:40:12');


insert into transaction values(1, '1011-1001-1001', '입금', '2월 정기급여', 3500000, '2020-02-10 12:36:12');
insert into transaction values(2, '1011-1001-1003', '출금', 'ATM 출금', 300000, '2020-02-10 12:37:12');
insert into transaction values(3, '1011-1001-1002', '입금', '2월 급여', 2800000, '2020-02-10 12:38:12');
insert into transaction values(4, '1011-1001-1001', '출금', '2월 공과금', 116200, '2020-02-10 12:39:12');
insert into transaction values(5, '1011-1002-1005', '출금', 'ATM 출금', 50000, '2020-02-10 12:40:12');



-- 문제 1 모든 고객 정보 조회
select * from customer;

-- 문제 2 모든 카드 정보 조회
select * from card;

-- 문제 3 모든 예금계좌 정보 조회
select * from account;

-- 문제 4 가장 최근 거래 내역 3건 조회
select *
from transaction
order by trans_date desc
fetch first 3 row only;

-- 문제 5 카드한도금액 200만원 이상인 고객의 이름과 카드종류 조회
select
    cu.name,
    ca.card_type
from card ca
join customer cu
    on ca.cust_jumin = cu.cust_jumin
where ca.card_limit >= 2000000;

-- 문제 6 예금계좌별 거래 건수 조회
select
    trans_acc_id,
    count(*) as 거래건수
from transaction
group by trans_acc_id;

-- 문제 7 거래금액이 100만원 이상인 거래 내역 조회(최근 거래순)
select *
from transaction
where trans_money >= 1000000
order by trans_date desc;

-- 문제 8 계좌와 연결된 카드 정보 조회(계좌ID, 카드ID, 카드종류) 
select
    a.acc_id,
    c.card_no,
    c.card_type
from account a
join card c on a.acc_id = c.acc_id;


-- 문제 9 예금구분이 '입금'인 거래의 총합 조회
select sum(trans_money) as total_deposit
from transaction
where trans_type = '입금';

-- 문제 10 예금잔고가 4,000,000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소 조회
select
    cu.name,
    cu.cust_jumin,
    cu.hp,
    cu.address,
    a.acc_balance
from account a
join customer cu
    on a.cust_jumin1 = cu.cust_jumin
where a.acc_balance >= 4000000
order by a.acc_balance desc;
