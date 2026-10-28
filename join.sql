CREATE DATABASE join_practice;
USE join_practice;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, '김철수', '서울'),
(2, '이영희', '부산'),
(3, '박민수', '대구'),
(4, '최수진', '인천'),
(5, '정우성', '광주');

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT
);

INSERT INTO products VALUES
(1, '노트북', 1500000),
(2, '마우스', 30000),
(3, '키보드', 100000),
(4, '모니터', 400000),
(5, '헤드셋', 150000);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO orders VALUES
(1, 1, 1, 1, '2024-11-01'),
(2, 1, 2, 2, '2024-11-02'),
(3, 2, 3, 1, '2024-11-03'),
(4, 2, 4, 1, '2024-11-05'),
(5, 3, 1, 1, '2024-11-08'),
(6, 3, 5, 3, '2024-11-10'),
(7, 4, 2, 5, '2024-11-11');

select * from customers;
select * from products;
select * from orders;

insert into customers values(6, "김태호", "tokyo");
insert into products values(8, "Alina", 98239);
insert into products values(9, "kimtaeho", 234234);
insert into orders values(100, 1, 3, 3, '2026-10-28');





-- join 
-- inner join
-- 서로 짝이 맞는 것만 가져오는 것
-- on 뒤엔 공통된 컬럼 -> 이걸로 짝이 맞는 걸 가져옴
select c.name, p.name from customers c inner join products p on c.id = p.id; 
select p.name, o.order_date from orders o inner join products p on p.name = "헤드셋";

-- outer join
-- left outrer join - 공통된 짝을 불러오되, 왼쪽 테이블의 모든 결과 출력되게 -> 공통 짝이 없으면 해당 컬럼은 null 처리
-- right outer join -         "         , 오른쪽 테이블의 모든 결과 출력되게 ->             "
-- full outer join -          "         , 모든 테이블의 모든 결과 출력되게 ->              "
select c.name, p.name from customers c left outer join products p on c.id = p.id; 
select p.price, o.order_date date from products p left outer join orders o on p.id = o.id;

select customers.name, products.name from customers right outer join products on customers.id = products.id;
-- select products.name, orders.order_date from products FULL OUTER JOIN orders on products.id = orders.product_id;
-- 헐 mysql은 full outer join 지원 안함






