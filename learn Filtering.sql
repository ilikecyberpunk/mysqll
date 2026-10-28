-- where 절로 필터링 ㄱㄴ
use macdonalds;
select * from burgers;
-- CREATE TABLE burgers (
-- 	id INTEGER, 		-- 아이디(정수형 숫자)
-- 	name VARCHAR(50), 	-- 이름(문자형: 최대 50자)
-- 	price INTEGER, 		-- 가격(정수형 숫자)
-- 	gram INTEGER, 		-- 그램(정수형 숫자)
-- 	kcal INTEGER, 		-- 열량(정수형 숫자)
-- 	protein INTEGER, 	-- 단백질량(정수형 숫자)
-- 	PRIMARY KEY (id) 	-- 기본키 지정: id
-- );
-- INSERT INTO burgers (id, name, price, gram, kcal, protein)
-- VALUES
-- 	(1, '빅맨', 5300, 223, 583, 27),
-- 	(2, '베이컨 틈메이러 디럭스', 6200, 242, 545, 27),
-- 	(3, '맨스파이시 상해 버거', 5300, 235, 494, 20),
-- 	(4, '슈비두밥 버거', 6200, 269, 563, 21),
-- 	(5, '더블 쿼터파운드 치즈', 7700, 275, 770, 50);

-- 비교 연산자
-- = != > >= < <= 
-- where price = 1000;
-- where price != 1000;
-- where price < 3000; etc ...
select * from burgers where price < 5500;
select * from burgers where price > 5500;
select * from burgers where protein < 25;
select * from burgers;
desc burgers;

-- 논리 :  and or not
select * from burgers where price > 5500 and protein > 25;
select * from burgers where price > 5500 or protein > 25;
select * from burgers where not protein = 27;


-- 산술 연산자
select 100+20;
select 100-2;
select 1*2;
select 124/234;
select 234%82;

-- 연산자 우선순위 괄호 > NOT > 산술연산자 > 비교연산자 > AND > OR
select true or true and false;

-- 별칭 추가하기 AS 키워드
select name as NAMEEEE, price + gram + kcal + protein as justSumOfThese from burgers where price = 5300;


