/*
	날짜 : 2025/08/08
    이름 : 이준우
    내용 : 3장 제약조건
*/

-- 실습 3-1 기본키 실습하기
create table user1(
	uid 	varchar(10),
    name	varchar(10),
    hp		char(13),
    age		int
);

drop table user1;
INSERT INTO User1 VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO User1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO User1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO User1 (uid, name, age) VALUES ('A104', '강감찬', 45);

select * from user2;
create table user2(
	uid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10),
    addr	varchar(50)
);
drop table user2;
-- 테이블의 첫번째 컬럼은
insert into user2 values('a101','김유신','1999-09-19', '김해시');

select * from user2;
-- 실습 3-2
create table user3 (
	vid 	varchar(10) primary key,
    name 	varchar(10),
    birth	char(10),
    hp		char(13) unique,
    addr	varchar(100)
);

drop table user3;
insert into user3 values('a101', '김유신', '1999-09-19', '010-1234-1001', '김해시');
insert into user3 values('a102', '김춘추', '1999-09-20', '010-1234-1002', '경주시');
insert into user3 values('a103', '장보고', '1998-01-20', null, '완도시');
insert into user3 values('a104', '강감찬', '1997-01-20', null, '서울시');
select * from user3;

-- 실습 3-3
create table parent (
	pid		varchar(10) primary key,
    name	varchar(10),
    birth	char(10),
    addr	varchar(100)
);

drop table child;
create table child(
	cid 	varchar(10) primary key,
    name 	varchar(10),
    hp 		char(13) unique,
    parent 	varchar(10),
    foreign key (parent) references Parent (pid) -- 존재하지 않는 parent의 pid값 입력을 차단
);

insert into parent values ('p101', '홍길동', '1999-09-09', '부산시');
insert into child values ('c101', '홍아들', '010-1234-2001', 'p101');
insert into child values ('c102', '김아들', '010-1234-3001', 'p110');
select * from parent;
select * from child;

-- 실습 3-4
drop table user4;
create table user4(
	uid		varchar(10) primary key,
    name	varchar(10) not null, -- 모든 컬럼은 default는 null
    gender	char(1), -- 모든 컬럼은 default는 null
    age		int default 1,
    hp		char(13) unique, -- unique default는 null
    addr	varchar(100)
);

insert into user4 values('a102', '김유신', 'M', '23', '010-1223-0001', '김해시');
insert into user4 values('a101', '신사임당', 'F', '21', null, '강릉시');
select * from user4;

-- 실습 3-5
-- 실습 3-6
-- 실습 3-7
-- 실습 3-8
-- 실습 3-9
create table user5(
	seq		int auto_increment primary key,
	name	varchar(10) not null,
	gender	char(1) check (gender in ('M', 'F')),
    age		int default 1 check(age > 0 and age < 100),
    addr	varchar(20)
);

-- 실습 3-10
insert into user5(name, gender, age, addr) values ('김유신', 'M', 23, '김해시');
insert into user5(name, gender, age, addr) values ('신사임당', 'F', 21, '강릉시');
delete from user5 where seq = 2;

insert into user5(name, gender, age, addr) values ('허난설현', 'M', 21, '충주시');
select * from user5;


