use macdonalds;

-- order by 
-- 특정 컬럼을 이용해 정렬한다
select * from burgers ORDER BY price; -- 오름차순
select * from burgers order by price DESC; -- 내림차순

select name as "칼로리 높은 순" from burgers order by kcal desc;


-- group by 
-- 데이터를 그룹으로 묶는다 -> 집계함수와 같이 쓰임
use bank;
select * from transactions;
select msg, count(*) from transactions group by msg;
select msg, sum(amount) from transactions group by msg;
select msg, max(amount) from transactions group by msg;
select msg, min(amount) from transactions group by msg order by min(amount) desc;
select min(created_at), msg from transactions group by msg order by min(created_at);
select msg, max(amount), min(amount) from transactions group by msg order by max(amount) desc;

-- Having 
-- group by로 묶인 결과를 조건으로 거른다
select msg, count(amount) from transactions group by msg having sum(amount) > 2000;
select msg, max(amount), min(amount) from transactions group by msg having max(amount) > 1000 order by max(amount) desc;
select msg, count(msg) from transactions group by msg having count(msg) > 5;

