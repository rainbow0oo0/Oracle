/*
    날짜 : 2025/07/14
    이름 : 이준우
    내용 : 2장 SQL 기본
*/

// select ' Hello Oracle !' from dual;

-- 실습 1-2. NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER (    
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6),
    num6 NUMBER(6, -1)
);

// 테이블 데이터 삭제
// delete from type_test_number;

insert into type_test_number (num1) values (1);
insert into type_test_number (num1) values (123);
insert into TYPE_TEST_NUMBER (num1) values (123.74);
insert into TYPE_TEST_NUMBER (num1) values (123.12345);

 //num2 NUMBER(2)
 insert into TYPE_TEST_NUMBER (num2) values (12);
 insert into TYPE_TEST_NUMBER (num2) values (123);
 insert into TYPE_TEST_NUMBER (num2) values (1.2);
 insert into TYPE_TEST_NUMBER (num2) values (1.23);
 insert into TYPE_TEST_NUMBER (num2) values (12.34567);
 insert into TYPE_TEST_NUMBER (num2) values (12.56789);
 insert into TYPE_TEST_NUMBER (num2) values (123.56789);


// 실습하기 1-3. 문자형 자료형 이해
insert into TYPE_TEST_NUMBER (num5) values (0.01);


// 실습하기 1-4. 테이블 생성
CREATE TABLE USER1 (
    USER_ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER
);

DROP TABLE USER1;

// 실습하기 1-5
INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
insert into user1 values ('A101', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);
insert into user1 (user_id, name, age) values ('A104', '강감찬', 45);
insert into user1 (user_id, name, hp) 
                    values ('A105', '이순신', '010-1234-5555');

// 실습하기 1-6
select * from user1;
SELECT * FROM USER1 WHERE USER_ID = 'A101';
SELECT * FROM USER1 WHERE NAME = '김춘추';
SELECT * FROM USER1 WHERE AGE > 30;

select user_id, name, age from user1;

// 실습하기 1-7
UPDATE USER1 SET 
                HP = '010-1234-1001',
                AGE = 27
             WHERE 
                USER_ID = 'A101';

// 실습하기 1-8
DELETE FROM USER1 WHERE USER_ID = 'A101';
DELETE FROM USER1 WHERE USER_ID = 'A102' AND AGE = 25;
DELETE FROM USER1 WHERE AGE >= 30;

-----------------------------------------------
// 2.제약 조건
-----------------------------------------------

-- 실습 1-2. NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER (    
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6),
    num6 NUMBER(6, -1)
);

// 테이블 데이터 삭제
delete from type_test_number;

insert into type_test_number (num1) values (1);
insert into type_test_number (num1) values (123);
insert into TYPE_TEST_NUMBER (num1) values (123.74);
insert into TYPE_TEST_NUMBER (num1) values (123.12345);

 //num2 NUMBER(2)
 insert into TYPE_TEST_NUMBER (num2) values (12);
 insert into TYPE_TEST_NUMBER (num2) values (123);
 insert into TYPE_TEST_NUMBER (num2) values (1.2);
 insert into TYPE_TEST_NUMBER (num2) values (1.23);
 insert into TYPE_TEST_NUMBER (num2) values (12.34567);
 insert into TYPE_TEST_NUMBER (num2) values (12.56789);
 insert into TYPE_TEST_NUMBER (num2) values (123.56789);


// 실습하기 1-3. 문자형 자료형 이해
insert into TYPE_TEST_NUMBER (num5) values (0.01);


// 실습하기 1-4. 테이블 생성
CREATE TABLE USER1 (
    USER_ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER
);

DROP TABLE USER1;

// 실습하기 1-5
INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
insert into user1 values ('A101', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);
insert into user1 (user_id, name, age) values ('A104', '강감찬', 45);
insert into user1 (user_id, name, hp) 
                    values ('A105', '이순신', '010-1234-5555');

// 실습하기 1-6
select * from user1;
SELECT * FROM USER1 WHERE USER_ID = 'A101';
SELECT * FROM USER1 WHERE NAME = '김춘추';
SELECT * FROM USER1 WHERE AGE > 30;

select user_id, name, age from user1;

// 실습하기 1-7
UPDATE USER1 SET 
                HP = '010-1234-1001',
                AGE = 27
             WHERE 
                USER_ID = 'A101';

// 실습하기 1-8
DELETE FROM USER1 WHERE USER_ID = 'A101';
DELETE FROM USER1 WHERE USER_ID = 'A102' AND AGE = 25;
DELETE FROM USER1 WHERE AGE >= 30;

-----------------------------------------------
// 2.제약 조건
-----------------------------------------------
drop table user2
-- 실습하기 2-1
CREATE TABLE USER2 (
    USER_ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER(2)
);

-- primary key(기본키) 컬럼은 중복 안됨
INSERT INTO USER2 VALUES ('A101', '김유신', '010-1234-1111', 23);
insert into user2 values ('A102', '김춘추', '010-1234-2222', 21);

drop table user3
// 실습하기 2-2
create table user3 (
    user_id     varchar2(20) primary key,
    name        varchar2(20),
    hp          char(13) UNIQUE,
    age         number(3)
);

insert into user3 values ('a101', '김유신', '010-1234-1001', 23);
insert into user3 values ('a102', '김춘추', '010-1234-1002', 21);

create table customer (
    CID         VARCHAR2(20) PRIMARY KEY,
    NAME        VARCHAR2(20) NOT NULL,
    HP          CHAR(13) UNIQUE,
    ADDRESS     VARCHAR2(200),
    RDATE       DATE NOT NULL
);

insert into customer values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into customer values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into customer values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into customer values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into customer values ('c105', '이성계', NULL, NULL, '2022-01-05');
insert into customer values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into customer values ('c107', '허준', NULL, NULL, '2022-01-07');
insert into customer values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into customer values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into customer values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');
