/*
	날짜 : 2025/08/12
	이름 : 이준우
	내용 : 데이터베이스 모델링 실습 2
*/

USE University;

create user 'hospital'@'%' identified by '1234';
grant all privileges on hospital.* to 'hospital'@'%';
flush privileges;

-- 사용자 추가
create user 'university'@'%' identified by '1234';
grant all privileges on university.* to 'university'@'%';
flush privileges;

-- 데이터 입력

-- department
insert into department values(10, '국어국문학과	', '051-510-1010');
insert into department values(11, '영어영문학과', '051-510-1011');
insert into department values(20, '경영학과', '051-510-1020');
insert into department values(21, '경제학과', '051-510-1021');
insert into department values(22, '정치외교학과', '051-510-1022');
insert into department values(23, '사회복지학과', '051-510-1023');
insert into department values(30, '수학과', '051-510-1030');
insert into department values(31, '통계학과', '051-510-1031');
insert into department values(32, '생명과학과', '051-510-1032');
insert into department values(40, '기계공학과', '051-510-1040');
insert into department values(41, '전자공학과', '051-510-1041');
insert into department values(42, '컴퓨터공학과', '051-510-1042');

select * from department;

-- professor
select * from professor;
insert into professor values('p10101', 10, '김유신', '750120-1234567', '010-1101-1976', 'kimys@hg.ac.kr', '서울');
insert into professor values('p10102', 10, '계백', '740610-1234567', '010-1102-1975', 'gaeback@hg.ac.kr', '서울');
insert into professor values('p11101', 11, '김유신', '880529-1234567', '010-1103-1989', 'kwanch@hg.ac.kr', '대전');
insert into professor values('p11103', 11, '김유신', '780412-1234567', '010-2101-1979', 'kimcc@hg.ac.kr', null);
insert into professor values('p11104', 11, '김유신', '650911-1234567', '010-2104-1966', 'leesabu@hg.ac.kr', '대전');
insert into professor values('p22110', 22, '김유신', '780727-1234567', '010-3101-1979', 'jangbg@hg.ac.kr', '대구');
insert into professor values('p23102', 23, '김유신', '830614-1234567', '010-4101-1984', 'gueen@hg.ac.kr', null);
insert into professor values('p31101', 31, '김유신', '641020-1234567', '010-5101-1965', 'kang@hg.ac.kr', '대구');
insert into professor values('p31104', 31, '김유신', '711127-1234567', '010-6101-1972', 'sinsa@hg.ac.kr', '부산');
insert into professor values('p40101', 40, '김유신', '910906-1234567', '010-7103-1992', 'leelee@hg.ac.kr', '부산');
insert into professor values('p40102', 40, '김유신', '881208-1234567', '010-7104-1989', 'hwang@hg.ac.kr', null);
insert into professor values('p42103', 42, '김유신', '760313-1234567', '010-8101-1977', 'ssh@hg.ac.kr', '광주');

-- student
select * from student;
insert into student values('20101001', 10, 'p10101', '정우성', '760121-1234567', '010-1101-7601', null, '서울');
insert into student values('20101002', 10, 'p10101', '이정재', '760111-1234567', '010-1102-7506', null, '서울');
insert into student values('20111011', 11, 'p11103', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com', null);
insert into student values('20111013', 11, 'p11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전');
insert into student values('20111014', 11, 'p11104', '원빈', '660912-1234567', '010-2104-6609', 'one@daum.net', '대전');
insert into student values('21221010', 22, 'p22110', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com', '대구');
insert into student values('21231002', 23, 'p23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', null);
insert into student values('22311011', 31, 'p31104', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net', '대구');
insert into student values('22311014', 31, 'p31104', '유재석', '721128-1234567', '010-6101-7211', null, '부산');
insert into student values('22401001', 40, 'p40101', '강호동', '920907-1234567', '010-7103-9209', null, '부산');
insert into student values('22401002', 40, 'p40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com', '광주');
insert into student values('22421003', 42, 'p42103', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com', '광주');

-- courese
select * from course;
insert into course values('101001', 'p10101', '대학 글쓰기', 2, 100, '본102');
insert into course values('101002', 'p10102', '한국어음운론', 3, 300, '본102');
insert into course values('101003', 'p10102', '한국현대문학사', 3, 300, '본103');
insert into course values('111011', 'p11103', '중세영문학', 3, 200, '본201');
insert into course values('111012', 'p11104', '영미시', 3, 200, '본201');
insert into course values('231110', 'p23102', '사회복지학개론', 2, 180, '별관103');
insert into course values('311002', 'p31101', '통계의 이해', 2, 160, '별관303');
insert into course values('311003', 'p31104', '기초 통계학', 3, 600, '별관303');
insert into course values('401019', 'p40101', '기계역학', 3, 600, '공학관 102');
insert into course values('421012', 'p42103', '데이터베이스', 3, 800, '공학관 103');

-- enrollment
select * from enrollment;
insert into Enrollment (stdNo, csNo, proNo) VALUES ('20101001', '101001','P10101');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('20101001', '101002','P10102');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('20111013', '111011','P11103');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('21231002', '231110','P23102');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('22401001', '401019','P40101');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('22401001', '421012','P42103');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('20101001', '101003','P10102');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('22421003', '311003','P31104');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('22421003', '421012','P42103');
insert into Enrollment (stdNo, csNo, proNo) VALUES ('20111013', '111012','P11104');

-- 문제1
select
	stdno,
    stdname,
    stdhp,
    d.depNo,
    depname
from student as s
join department as d on s.depno = d.depNo;

-- 문제2
-- 문제2
SELECT
	proNo,
	proName,
	proHp,
	d.depNo,
	depName
FROM Professor AS p
JOIN Department AS d ON p.depNo = d.depNo;

-- 문제3
SELECT
	csNo,
	csName,
	proName,
	proHp
FROM Course AS c
JOIN Professor AS p ON c.proNo = p.proNo;

-- 문제4
SELECT 
	csNo,
	csName,
	b.proNo,
	proName,
	proHp,
	c.depNo,
	depName
FROM Course AS a
JOIN Professor AS b ON a.proNo = b.proNo
JOIN Department AS c ON b.depNo = c.depNo;


-- 문제5
SELECT 
	a.stdNo,
	b.stdName,
	a.csNo,
	c.csName,
	a.proNo,
	d.proName
FROM Enrollment AS a
JOIN Student AS b ON a.stdNo = b.stdNo
JOIN Course AS c ON a.csNo = c.csNo
JOIN Professor AS d ON a.proNo = d.proNo;

-- 문제6
set sql_safe_updates = 0; -- where절 없는 update를 실행하기 위해 safe mode 해제
UPDATE Enrollment SET
							scoreAttd = CEIL(RAND() * 100),
							scoreMid   = CEIL(RAND() * 100),
							scoreFinal = CEIL(RAND() * 100);
				
-- 문제7
UPDATE Enrollment SET scoreTotal = (scoreAttd + scoreMid + scoreFinal) / 3;

-- 문제8
UPDATE Enrollment SET scoreGrade = if(scoreTotal >= 90, 'A', 
								   if(scoreTotal >= 80, 'B',
								   if(scoreTotal >= 70, 'C',
								   if(scoreTotal >= 60, 'D', 'F'))));

-- 문제9
SELECT MAX(scoreTotal) FROM Enrollment;

SELECT scoreTotal FROM Enrollment ORDER BY scoreTotal DESC LIMIT 1;

-- 문제10
SELECT 
	AVG(scoreTotal) 
FROM Enrollment AS a
JOIN Student AS b ON a.stdNo = b.stdNo
WHERE stdName='정우성';