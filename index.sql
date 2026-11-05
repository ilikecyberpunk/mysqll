-- 인덱스로 데이터 찾을 수 있음
-- 테이블 생성할때 키를 지정해서 그 키로 찾는 느낌
-- 장점 : select문으로 찾는 속도 좋음 -> 컴 부담 줄어서 컴 성능 상승
-- 단점 : 인덱스도 공간을 차지해서, 데이터베이스 안에 추가적인 공간 필요함

-- 클러스터형 인덱스 = 기본 인덱스 = 영어사전 느낌
-- 비 클러스터형 인덱스 = 보조 인덱스 = 책 뒤에 찾아보기 느낌

use index_practice; --이건 attribute가 총 8개임 == 8개의 index !!
-- primary키 생성되어 있음 == 클러스터형 인덱스가 이 열에 생성이 됨

CREATE DATABASE index_practice;
USE index_practice;

CREATE TABLE member(
    mem_id      CHAR(5) PRIMARY KEY,
    mem_name    VARCHAR(20) NOT NULL,
    mem_addr    VARCHAR(20),
    mem_age     INT,
    mem_height  DECIMAL(4,1),
    mem_email   VARCHAR(50) UNIQUE,
    mem_phone   VARCHAR(20) UNIQUE
);

INSERT INTO member VALUES
('M001','김철수','서울',25,175.5,'kim@test.com','010-1111-1111'),
('M002','이영희','부산',22,163.2,'lee@test.com','010-2222-2222'),
('M003','박민수','서울',30,180.1,'park@test.com','010-3333-3333'),
('M004','최수진','인천',27,168.9,'choi@test.com','010-4444-4444'),
('M005','정우성','대구',29,177.3,'jung@test.com','010-5555-5555');


show index from member;
-- 이걸 보면 key name이라고 되어있는 부분 == 클러스터형 인덱스임
-- non unique부분 0 -> false라는 뜻이니 유니크 하단거 -> 중복된 값 넣을 수 없다

-- 보조 인덱스 만들기
create index sub_index on member(mem_age);

-- 별건 없고 걍 인덱스로 되어있는 값 where로 찾는 거임
-- 모든 데이터 순회할 필요 없이 인덱스로 되있는 곳에서 값 찾아





