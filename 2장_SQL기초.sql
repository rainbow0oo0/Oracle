/*
	날짜 : 2025/08/08
    이름 : 이준우
    내용 : 2장 SQL 기초
*/

-- 실습 2-8
use studydb;


create table tbluser (
	user_id		varchar(10) primary key,
    user_name	varchar(10) not null,
    user_hp		char(13),
    user_age	int,
    user_addr	varchar(100)
);

create table tblproduct(
	prod_no			int primary key,
    prod_name		varbinary(20),
    prod_price		int,
    prod_stock		int,
    prod_company	varchar(20),
    prod_date		date
);

-- 실습 2-9
insert into tbluser values('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
insert into tbluser values('p102', '김춘추', '010-1234-1002', 25, '경남 경주시');
insert into tbluser values('p103', '장보고', null, 31, '전남 완도군');
insert into tbluser values('p104', '강감찬', null, null, '서울 중구');
insert into tbluser values('p105', '이순신', '010-1234-1005', 50, null);

insert into tblproduct values(1001, '냉장고', 800000, 25, 'LG전자', '2022-01-06');
insert into tblproduct values(1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07');
insert into tblproduct values(1003, '모니터', 350000, 35, 'LG전자', '2023-01-13');
insert into tblproduct values(1004, '세탁기', 1000000, 80, '삼성전자', '2021-01-01');
insert into tblproduct values(1005, '컴퓨터', 1500000, 20, '삼성전자', '2023-10-01');


-- 실습 2-9
select * from tbluser;
select user_name from tbluser;
select * from tbluser where user_id='p102';
select * from tbluser where user_id='p104'; or user_id='p105';
select * from tbluser where use_addr='부산시 금정구';
select * from tbluser where user_age > 30;
select * from tbluser where user_hp is null;
update tbluser set user_age=42 where user_id='p104';
update tbluser set user_addr='부산시 진구' where user_id='p105';
delete from tbluser where user_id='p103';

select * from tblproduct;
select prod_name from tblproduct;
select prod_name, prod_company, prod_price from tblproduct;
select * from tblproduct where prod_company='LG전자';
select * from tblproduct where prod_company='삼성전자';
update tblproduct set
		prod_company='삼성전자',
        prod_date='2024-01-01'
        where prod_no=1006;


drop table user1copy;

CREATE TABLE User1 (
uid VARCHAR(10),
name VARCHAR(10),
hp CHAR(13),
age INT
);
























