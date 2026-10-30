-- transaction ACID
-- 너는 서버가 터져도, 데이터베이스 안의 데이터는 정상일 꺼라는 믿음이 있지?
-- 그 근간이 ACID에 있어

-- transaction : 하나의 논리적인 작업 단위
--      for ex) 송금transaction : 
--      1. 내 계좌에서 1만원 차감
--      2 상대 계좌에 1만원 입금
--      근데 이 과정에서 서버가 꺼지면? -> 그래서 ACID라는 안전장치가 필요한거야

-- A - Atomicity 원자성
--     전부 성공하거나, 전부 취소   commit or rollback

-- C - Consistency 
--      무결성 제약 조건을 항상 만족
--          도메인 제약 -> 잔액 컬럼은 항상 0 이상 -> 여기서 도메인 = 컬럼이 가지는 원자값
--          참조 무결성 -> 데이터가 존재해야함
--          유일성 제약 -> 데이터 중복 ㄴㄴ

-- I - isolation 고립성
--      동시에 transaction이 실행될 때 서로 방해하면 안됨

-- D - Durability 지속성
--      완료(commit)된 transaction은 영구적으로 보존되어야 함 = 시스템 장애가 있어도 데이터 보존


create DATABASE practice_transaction;
use practice_transaction;

CREATE TABLE accounts (
    id INT PRIMARY KEY,
    balance INT NOT NULL
);

INSERT INTO accounts VALUES
(1, 50000),
(2, 20000);

START TRANSACTION; -- 지금부터 실행하는 여러 데이터 변경 작업을 하나의 작업으로 묶겠다고 데이터베이스에 알리는 명령어.
-- 약간 깃으로 저장하는 느낌
-- commit으로 실행과정 기록 남기고 rollback으로 실행 전으로 돌아가는 느낌

UPDATE accounts
SET balance = balance - 10000
WHERE id = 1;

UPDATE accounts
SET balance = balance + 10000
WHERE id = 2;

COMMIT;

select * from accounts;

rollback;


