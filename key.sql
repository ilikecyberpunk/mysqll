-- 릴레이션 키
-- 각 튜플을 고유하게 식별할 수 있는 애트리뷰트들의 모임
-- superkey, candidate key, primary key, alternate key, foreign key

-- PK = primary key -> 테이블의 고유한 키
-- FK = foreign key -> 다른 테이블의 PK등을 참조해서, 두 테이블을 연결하는 역할
-- 참조 무결성 = 존재하지 않는 데이터를 가르킬 수 없도록 한다


use pk_fk_practice;

create table customers(id int primary key, name varchar(50));
create table orders(
    id int AUTO_INCREMENT PRIMARY key,
    customer_id int not null, -- 이걸 해줘야, 참조중이 아닌 즉 존재하지 않는 고객의 주문을 막을 수 있다
    order_date DATETIME,

    foreign key(customer_id) references customers(id)
);


INSERT INTO customers VALUES (1,'철수');
INSERT INTO customers VALUES (2, '영희');
insert into orders(customer_id,order_date) values (1, now());
insert into orders(customer_id, order_date) values (2, now()); 

select * from customers;
select*from orders;
select c.id, o.customer_id, o.order_date from customers c INNER JOIN orders o on c.id = o.customer_id order by id;
