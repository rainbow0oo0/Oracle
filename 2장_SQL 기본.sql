/*
    날짜 : 2025/07/14
    이름 : 이준우
    내용 : 2장 SQL 기본
*/
-- 실습 1-2. NUMBER 자료형 이해
-- 실행 Ctrl + Enter

CREATE TABLE TYPE_TEST_NUMBER (
    num1 NUMBER, 
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6),
    num6 NUMBER(6, -1) // -1 반올림
);

// num1 NUMBER
insert into TYPE_TEST_NUMBER (num1) values(1);
insert into TYPE_TEST_NUMBER (num1) values(123);
insert into TYPE_TEST_NUMBER (num1) values(123.74);
insert into TYPE_TEST_NUMBER (num1) values(123.12345);

//테이블 데이터 삭제
// delete from type_test_number;

// num2 NUMBER
insert into TYPE_TEST_NUMBER (num2) values(12);
insert into TYPE_TEST_NUMBER (num2) values(123); // error
insert into TYPE_TEST_NUMBER (num2) values(1.2);
insert into TYPE_TEST_NUMBER (num2) values(12.34567);
insert into TYPE_TEST_NUMBER (num2) values(123.56789);// error

// num3 NUMBER(3,1)
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (123); // error
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);
insert into TYPE_TEST_NUMBER (num3) values (123.56789); //error

// 실습하기 1-3. 문자형 자료형 이해
//num3 NUMBER(3,1)
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (123);
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);
insert into TYPE_TEST_NUMBER (num3) values (123.56789);

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
insert into user1 values ('A102', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);
insert into user1 (user_id, name, age) values ('A104', '강감찬', 45);
insert into user1 (user_id, name, hp) 
            values('A105','이순신', '010-1234-5555');

// 실습하기 1-6
select * from user1;
select * from user1 where user_id = 'A101';
select * from user1 where name = '김춘추';
select * from user1 where age > 30;
select user_id, name, age from user1;


// 실습하기 1-7 *
UPDATE USER1 SET hp = '010-1234-4444' WHERE user_id = 'A104';

// 실습하기 1-8
// DELETE 뒤에 조건식?이 붙어야 한다
DELETE FROM USER1 WHERE USER_ID 'A101';
DELETE FROM USER1 WHERE USER_ID 'A102' AND AGE = 25;
DELETE FROM USER1 WHERE AGA >= 30;

--------------------------------------------------
// 2. 제약 조건
--------------------------------------------------

-- 실습하기 2-1
CREATE TABLE USER2(
    USER_ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER(2)
);

INSERT INTO USER2 VALUES ('A101', '김유신', '010-1234-1111', 23);
insert into user2 values ('A101', '김춘추', '010-1234-2222', 21);

// 실습하기 2-2
create table user3(
    user_id  varchar2(20) primary key,
    name     varchar2(20),
    hp       char(13) UNIQUE,
    age      number(3)

);

insert into user3 values 




