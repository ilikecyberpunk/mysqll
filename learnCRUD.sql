/*
데이터 CRUD
*/

-- 쿼리 -> sql로 작성한 명령 코드이다
SHOW DATABASES;             -- 어떤 db들이 있나 -> 이게 하나의 쿼리라고 할 수 있다
CREATE DATABASE macdonalds; -- DB만들기
USE macdonalds;             -- 만들어진 DB로 접속하기
DROP DATABASE macdonalds;   -- db삭제
SELECT DATABASE();            -- 현재 사용 중인 db조회


-- 테이블 만들기 -> 
CREATE TABLE burgers(
    -- 컬럼명1 자료형1
    -- 컬럼명2 자료형2
    -- ...
   
    id INTEGER, -- 컬럼명1, 정수형
    name VARCHAR(50), -- 컬럼명2, 문자형 -> 최대ㅑ50글자 문자 저장공간
    price INTEGER,
    gram INTEGER,
    kcal INTEGER,
    protein INTEGER,

    PRIMARY KEY(id) -- 키본 키 지정 -> 주민등록번호 같은거 -> 테이블을 식별할때 이 기본 키로 알 수 있다 = 테이블을 대표하는 키
);

-- 테이블 구조 조회
DESC burgers;

-- 단일 데이터 삽입
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...)
-- VALUES(입력값1, 입력값2 ...)
INSERT INTO burgers(id, name, price, gram, kcal, protein) VALUES(1, "bigmac", 5300, 233, 583, 27);

-- 데이터 조회
-- SELECT 컬럼명1 컬럼명2 .. from 테이블명 where 검색조건 ;
SELECT * FROM burgers;  

-- 다중 데이터 삽입
INSERT INTO burgers(id, name, price, gram, kcal, protein) 
VALUES
(5, "더블 쿼터 파운드 버거", 7700, 275, 770, 50),
(2, "베이컨 틈메이러 디럭스", 6200, 242, 545, 27),
(3, "맨스파이시 상해 버거", 5300, 235, 583, 27),
(4, "슈비두밥 버거", 6200 , 269, 563, 21);

SELECT name, price FROM burgers; -- 특정컬럼

-- 연습
create DATABASE me;
use me;
drop database me;
SELECT DATABASE();

create table abt_me(name VARCHAR(50), age integer, gender VARCHAR(50), primary key(name));
drop table abt_me;

desc abt_me;
SELECT * from abt_me;
insert into abt_me(name, age, gender) VALUES("kimtaeho", 22, "male"),("alina", 25, "women");
SELECT name from abt_me;




