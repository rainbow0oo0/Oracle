CREATE TABLE lecture (
    lecno     NUMBER NOT NULL,
    lecname   VARCHAR2(20 BYTE) NOT NULL,
    leccredit NUMBER NOT NULL,
    lectime   NUMBER NOT NULL,
    lecclass  VARCHAR2(10)
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    regstdno      CHAR(8) NOT NULL,
    reglecno      NUMBER NOT NULL,
    regmidscore   NUMBER,
    regfinalscore NUMBER,
    regtotalscore NUMBER,
    reggrade      CHAR(1)
);

CREATE TABLE student (
    stdno      CHAR(8) NOT NULL,
    stdname    VARCHAR2(20 BYTE) NOT NULL,
    stdhp      CHAR(13) NOT NULL,
    stdyear    NUMBER NOT NULL,
    stdaddress VARCHAR2(100 BYTE)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE student ADD CONSTRAINT student__un UNIQUE ( stdhp );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk FOREIGN KEY ( reglecno )
        REFERENCES lecture ( lecno );

ALTER TABLE register
    ADD CONSTRAINT register_student_fk FOREIGN KEY ( regstdno )
        REFERENCES student ( stdno );

-- 실습 6-9
insert into student values('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
insert into student values('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into student values('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
insert into student values('20210324', '김유신', '010-1234-1004', 2, '서울 관악구');
insert into student values('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

insert into lecture values(101, '컴퓨터과학개', 2, 40, '본301');
insert into lecture values(102, '프로그래밍언', 3, 52, '본302');
insert into lecture values(103, '데이터베이스', 3, 56, '본303');
insert into lecture values(104, '자료구조', 3, 60, '본304');
insert into lecture values(105, '운영체제', 3, 52, '본305');


insert into register values('20220415', 101, 60, 30, null, null);
insert into register values('20210324', 103, 54, 36, null, null);
insert into register values('20201011', 105, 52, 28, null, null);
insert into register values('20220415', 102, 38, 40, null, null);
insert into register values('20210324', 104, 56, 32, null, null);
insert into register values('20210213', 103, 48, 40, null, null);

-- 실습 6-9
select stdno, stdname, stdhp, stdyear
from student a
left join register b
    on a.stdno = b.regstdno
where b.regstdno is null;


//select
//    reglecno
//    case
//        when (regmidscore + reregfinalscore >= 90) then 'A'
//    else 'F'
//   end as 등급 
//from register;
