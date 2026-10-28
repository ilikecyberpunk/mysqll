-- 데이터 수정 = update
-- update 테이블명 set 컬럼명 = 입력값 where 조건
use macdonalds;
UPDATE burgers set price = 1000;

-- 안전모드 해제0 / 설정1
set SQL_SAFE_UPDATES = 1;

select * from burgers;

-- 빅맨 버거만 500원
update burgers set price = 500 where name = "빅맨"; -- 안전모드에선 특정 대상값 변경시, 조건은 반드시 기본키 사용해야함 -> 안전모드 켜있으면 에러
update burgers set price = 500 where id = 1;

-- 데이터 삭제
-- DELETE FROM 테이블 명 where 검색조건
delete from burgers where id = 4;

-- 전체 테이블 삭제
-- DROP TABLE 테이블 명
DROP TABLE burgers;
DESC burgers; -- 삭제해서 실행 안됨






-- 연습
use me;
select * from abt_me;
update abt_me set gender = "non binary" where name = "kimtaeho";
update abt_me set gender = "sigma" where age = 25;
desc abt_me;
insert into abt_me(name, age, gender) VALUES("sadness", 1, "no defination");
delete from abt_me where name="0";
delete from abt_me where name = "sadness";
drop table abt_me;


