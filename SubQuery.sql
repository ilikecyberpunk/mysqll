--sub query -> query안에 들어가는 query
-- 대표적 select, from, where 절 안에 들어감

-- 실행 결과가 하나다 -> 단일행 서브쿼리
-- 여러개 -> 다중행 서브쿼리









use join_practice;
select * from customers;
select * from products;
select * from orders;


update customers set name = "kkk" where id=1;


--SELECT 안쪽 -> scalar SubQuery 
select id, (select customer_id from orders where customer_id = id) as customer_id_4 from orders order by id;





-- FROM 안쪽 -> inline view 
select * from (select p.name, p.price from products p where p.price > 30000) as result where result.name = "노트북"





-- where 안쪽 -> 중첩 subQuery
use join_practice;
select * from customers;
select * from products;


select * from products where price = (select max(price) from products);