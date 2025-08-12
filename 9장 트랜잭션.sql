/*
    날짜 : 2025/08/12
    이름 : 이준우
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1
// 스레드랑 같은 개념
select * from account;

update account set 
        acc_balance = acc_balance - 10000
        where acc_no = '101-11-1001';
        
update account set 
        acc_balance = acc_balance + 10000
        where acc_no = '101-11-1003';

select * from account;

-- 작업확정
commit;

-- 실습 8-2
update account set 
        acc_balance = acc_balance - 10000
        where acc_no = '101-11-1001';
        
update account set 
        acc_balance = acc_balance + 10000
        where acc_no = '101-11-1003';

select * from account;

-- 작업취소
rollback;

-- 실습 8-3
show autocommit; -- 커밋 상태 보기

set autocommit on; -- 자동 커밋 on
set autocommit off;

select * from account;

update account set 
        acc_balance = acc_balance - 10000
        where acc_no = '101-11-1001';
        
update account set 
        acc_balance = acc_balance + 10000
        where acc_no = '101-11-1003';









