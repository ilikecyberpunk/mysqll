-- 데이터 집계하기
-- 데이터 집계함수 => 통계적 계산을 돕는 도구 => max최댓값, min 최솟값, count 튜플의 개수 반환, sum 합계 반환, avg 평균
use macdonalds;
select * from burgers;

-- 가장 비싼 가격, 낮은가격
SELECT MAX(price), MIN(price) from burgers; 

-- 240무게가 넘는 버거 개수
SELECT COUNT(*) from burgers where gram > 240;
-- count함수는 입력을 어찌 하느냐에 따라 다른 결과를 만듦
-- count(*) 전체 레코드 수 = 행의 수
-- count(컬럼) 해당 컬럼이 null이 아닌 레코드의 수 = null이면 안찍힘

-- 더미 데이터
-- CREATE TABLE employees (
-- 	id INTEGER, 				-- 아이디
-- 	name VARCHAR(50), 			-- 직원명
-- 	department VARCHAR(200), 	-- 소속 부서
-- 	PRIMARY KEY (id) 			-- 기본키 지정: id
-- );

-- -- employees 데이터 삽입
-- INSERT INTO employees (id, name, department)
-- VALUES
-- 	(1, 'Alice', 'Sales'),
-- 	(2, 'Bob', 'Marketing'),
-- 	(3, 'Carol', NULL),
-- 	(4, 'Dave', 'Marketing'),
-- 	(5, 'Joseph', 'Sales');

SELECT COUNT(department) from employees;
SELECT COUNT(*) FROM employees;
select count(id) from employees;



-- 모든 버거의 가격 총합
select sum(price) from burgers; 

-- 버거 가격 평균
select avg(price) from burgers;








-- 데이터 셋
CREATE DATABASE bank;
USE bank;

-- transactions 테이블 생성
CREATE TABLE transactions (
	id INTEGER, 			-- 아이디
	amount DECIMAL(12, 2), 	-- 거래 금액
	msg VARCHAR(15), 		-- 거래처
	created_at DATETIME, 	-- 거래 일시
	PRIMARY KEY (id) 		-- 기본키 지정: id
);

-- transactions 데이터 삽입
INSERT INTO transactions (id, amount, msg, created_at)
VALUES
	(1, -24.20, 'Google', '2024-11-01 10:02:48'),
	(2, -36.30, 'Amazon', '2024-11-02 10:01:05'),
	(3, 557.13, 'Udemy', '2024-11-10 11:00:09'),
	(4, -684.04, 'Bank of America', '2024-11-15 17:30:16'),
	(5, 495.71, 'PayPal', '2024-11-26 10:30:20'),
	(6, 726.87, 'Google', '2024-11-26 10:31:04'),
	(7, 124.71, 'Amazon', '2024-11-26 10:32:02'),
	(8, -24.20, 'Google', '2024-12-01 10:00:21'),
	(9, -36.30, 'Amazon', '2024-12-02 10:03:43'),
	(10, 821.63, 'Udemy', '2024-12-10 11:01:19'),
	(11, -837.25, 'Bank of America', '2024-12-14 17:32:54'),
	(12, 695.96, 'PayPal', '2024-12-27 10:32:02'),
	(13, 947.20, 'Google', '2024-12-28 10:33:40'),
	(14, 231.97, 'Amazon', '2024-12-28 10:35:12'),
	(15, -24.20, 'Google', '2025-01-03 10:01:20'),
	(16, -36.30, 'Amazon', '2025-01-03 10:02:35'),
	(17, 1270.87, 'Udemy', '2025-01-10 11:03:55'),
	(18, -540.64, 'Bank of America', '2025-01-14 17:33:01'),
	(19, 732.33, 'PayPal', '2025-01-25 10:31:21'),
	(20, 1328.72, 'Google', '2025-01-26 10:32:45'),
	(21, 824.71, 'Amazon', '2025-01-27 10:33:01'),
	(22, 182.55, 'Coupang', '2025-01-27 10:33:25'),
	(23, -24.20, 'Google', '2025-02-03 10:02:23'),
	(24, -36.30, 'Amazon', '2025-02-03 10:02:34'),
	(25, -36.30, 'Notion', '2025-02-03 10:04:51'),
	(26, 1549.27, 'Udemy', '2025-02-14 11:00:01'),
	(27, -480.78, 'Bank of America', '2025-02-14 17:30:12');

SELECT * from transactions;

-- 거레 금액의 합
SELECT SUM(amount) FROM transactions;
-- 구글만
SELECT SUM(amount) FROM transactions WHERE msg = "Google";

-- 거래 금액의 최대 최소
SELECT MAX(amount) AS "maximum trade cost" FROM transactions;
SELECT MIN(amount) AS "minimum trade cost" FROM transactions;
-- 구글만 
SELECT MAX(amount) AS "miximum trade cost(Google)" FROM transactions;

-- 거래 횟수 세기
SELECT COUNT(*) AS "trade count" FROM transactions;
-- 아마존과 쿠팡만
SELECT COUNT(*) AS "trade count(Amazon, Coupang)" FROM transactions WHERE msg = "Coupang" OR msg = "Amazon";
-- IN 연산자 활용
select count(*) as "trade count(Amazon, Coupang)" from transactions where msg IN ("Amazon", "Coupang");



-- 입금 금액의 평균
SELECT AVG(amount) AS "average amount" FROM transactions WHERE amount > 0;
SELECT AVG(amount) AS "average amount" FROM transactions WHERE amount > 0 AND msg IN("Amazon", "Google");


-- 거레처 목록 조회 -> 중복 제거 필요함 -> DISTINCT
SELECT COUNT(DISTINCT msg) from transactions;
select count(distinct msg) from transactions;


