/*
	날짜 : 2025/08/08
    이름 : 이준우
    내용 : 4장 SQL 고급 실습
*/

-- 실습 4-1
drop table member;
create table member (
	uid		varchar(10) not null primary key,
    name	varchar(10) not null,
    hp		char(13) not null unique, 
    pos		varchar(10) not null default '사원',
    dep		int default null,
    rdate	datetime not null
);

drop table department;
create table department (
	depno	int not null primary key,
    name	varchar(10) not null,
    tel		varchar(12) not null
);
select * from department;

create table sales (
	seq		int auto_increment primary key,
    uid		varchar(10) not null,
    year	year not null,
    month	int not null,
    sale	int
);

-- 실습 4-2
select * from member;
insert into member values('a101', '박헉거세', '010-1234-1001', '부장', 101, '2020-11-19-11:39:48');
insert into member values('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19-11:39:48');
insert into member values('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19-11:39:48');
insert into member values('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19-11:39:48');
insert into member values('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19-11:39:48');
insert into member values('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19-11:39:48');
insert into member values('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19-11:39:48');
insert into member values('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19-11:39:48');
insert into member values('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19-11:39:48');
insert into member values('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19-11:39:48');
insert into member values('a111', '박지원', '010-1234-1011', '부원', 105, '2020-11-19-11:39:48');

select * from department;
insert into department values(101, '영업1부', '051-512-1001');
insert into department values(102, '영업2부', '051-512-1002');
insert into department values(103, '영업3부', '051-512-1003');
insert into department values(104, '영업4부', '051-512-1004');
insert into department values(105, '영업5부', '051-512-1005');
insert into department values(106, '영업지원부', '051-512-1006');
insert into department values(107, '인사부', '051-512-1007');

select * from sales;
INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 1,  98100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 1, 136000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 1,  80100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2018, 1,  78000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 1,  93000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 2,  23500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 2, 126000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 2,  18500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 2,  19000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2018, 2,  53000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2019, 1,  24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 1, 109000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 1, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 1,  53500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2019, 1,  24000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 2, 160000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 2, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 2,  43000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2019, 2,  24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2019, 2, 109000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 1, 201000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 1,  63000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 1,  74000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2020, 1, 122000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2020, 1, 111000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 2, 120000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2020, 2,  93000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 2,  84000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 2, 180000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a108', 2020, 2,  76000);

-- 실습 4-3
select * from member where name = '김유신';
select * from member where pos = '차장' and dep = 101;
select * from member where pos = '차장' or dep = 101;
select * from member where name != '김춘추';
select * from member where name <> '김춘추';
select * from member where pos = '사원' or pos = '대리';
select * from member where pos in ('사원', '대리');
select * from member where dep in (101, 102, 103);
select * from member where name like '%신';
select * from member where name like '김%';
select * from member where name like '김__';
select * from member where name like '_성_';
select * from member where name like '정_';
select * from sales where sale > 50000;
select * from sales where sale >= 50000 and sale < 100000 and month=1;
select * from sales where sale between 50000 and 100000;
select * from sales where sale not between 50000 and 100000;
select * from sales where year in (2020);
select * from sales where month in(1, 2);

-- 실습 4-4
select * from sales order by sale;
select * from sales order by sale asc;
select * from sales order by sale desc;
select * from member order by name;
select * from member order by name desc;
select * from sales where sale > 50000 order by sale desc;
select * from sales
	where sale > 50000
    order by year, month, sale desc;

-- 실습 4-5
select * from sales limit 3;
select * from sales limit 0, 3;
select * from sales limit 1, 2;
select * from sales limit 5, 3;
select * from sales order by sale desc limit 3, 5;
select * from sales  where sale < 50000 order by sale desc limit 3;
select * from sales
	where sale > 50000
	order by year desc, month, sale desc
    limit 5;

-- 실습 4-6
select sum(sale) as 합계 from sales;
select avg(sale) as 평균 from sales;
select max(sale) as 최대값 from sales;
select min(sale) as 최소값 from sales;
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceiling(rand() * 10);
select count(sale) as 갯수 from sales;
select count(*) as 갯수 from sales;

select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6, 5);
select concat('Hello', 'World');
select concat(uid, name, hp) from member where uid='a108';

select curdate();
select curtime();
select now();
insert into member values('a112', '유관순', '010-1234-1012', '대리', 107, now());

-- 실습 4-7
select sum(sale) as ' 2018년 1월 매출 총합'
	from sales
    where year = 2018 and month = 1;

-- 실습 4-8
select
	sum(sale) as ' 2019년 2월 5만원 이상 총합',
	avg(sale) as ' 2019년 2월 5만원 이상 평균'
	from sales
    where year = 2019 and month = 2 and sale >= 50000;

-- 실습 4-9
select
    min(sale) as '최저 매출',
	max(sale) as '최고 매출'
	from sales
    where year = 2020;

-- 실습 4-10
select uid from sales group by uid;
select year from sales group by year;
select uid, year from sales group by uid, year;
select uid, count(*) as 건수 from sales group by uid;
select uid, sum(sale) as 합계 from sales group by uid;
select uid, avg(sale) as 합계 from sales group by uid;

select uid, year, sum(sale) as 합계
 from sales
 group by uid, year;
 
select uid, year, sum(sale) as 합계
 from sales
 group by uid, year
 order by year asc, 합계 desc;

-- 실습 4-11
-- 실습 4-12

update sales set year = year  + 3;
-- 실습 4-13
-- 실습 4-14
-- 실습 4-15
-- 실습 4-16
-- 실습 4-17
