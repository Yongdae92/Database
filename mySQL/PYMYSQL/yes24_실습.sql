USE yes24;

-- 기본 조회 및 필터링
SELECT * FROM Books;
SELECT title, author FROM Books;
SELECT * FROM Books WHERE rating >= 8.0;
SELECT title, review FROM Books WHERE review >= 100;
SELECT title, price FROM Books WHERE price < 20000;
SELECT * FROM Books WHERE ranking_weeks >= 4 ORDER BY ranking_weeks DESC;
SELECT * FROM Books WHERE author = '자청 저';
SELECT * FROM Books WHERE publisher = '웅진지식하우스';

-- 조인 및 관계
SELECT author, COUNT(*) AS books_count FROM Books GROUP BY author ORDER BY books_count DESC;
SELECT publisher, COUNT(*) AS publishing_count FROM Books GROUP BY publisher ORDER BY publishing_count DESC LIMIT 1;
SELECT author, AVG(rating) AS rating_avg FROM Books GROUP BY author ORDER BY rating_Avg DESC;
SELECT * FROM Books WHERE ranking = 1;
SELECT title, sales, review FROM Books ORDER BY sales DESC, review DESC LIMIT 10;
SELECT * FROM Books ORDER BY publishing DESC LIMIT 10;

-- 집계 및 그룹화
SELECT author, AVG(rating) FROM Books GROUP BY author ORDER BY AVG(rating) DESC;
SELECT publishing, COUNT(*) FROM Books GROUP BY publishing;
SELECT publisher, AVG(price) FROM Books GROUP BY publisher ORDER BY AVG(price);
SELECT * FROM Books ORDER BY review DESC LIMIT 5;
SELECT ranking, AVG(review) FROM Books GROUP BY ranking;

-- 서브쿼리 및 고급 기능
SELECT * FROM Books WHERE rating > (SELECT AVG(rating) FROM Books);
SELECT title, price FROM Books WHERE price > (SELECT AVG(price) FROM Books);
SELECT title, sales FROM Books WHERE sales > (SELECT AVG(sales) FROM Books) ORDER BY sales DESC;
SELECT author, title FROM Books WHERE author = (SELECT author FROM Books GROUP BY author ORDER BY COUNT(*) DESC LIMIT 1);

-- 데이터 수정 및 관리
UPDATE Books SET price = 9999 WHERE title = "한국사";
UPDATE Books SET title = '제목업데이트' WHERE author = '최태성 저';
DELETE FROM Books WHERE sales = (SELECT MIN(sales) FROM Books);
UPDATE Books SET rating = rating+1 WHERE publisher = '웅진하우스';

-- 데이터 분석 예제
SELECT author, AVG(rating), AVG(sales) from Books GROUP BY author ORDER BY AVG(sales);
SELECT publishing, AVG(price) FROM Books GROUP BY publishing ORDER BY publishing DESC;
SELECT publisher, COUNT(*) AS book_count, SUM(review) AS total_review FROM Books GROUP BY publisher ORDER BY book_count DESC;
SELECT ranking, AVG(sales) FROM Books GROUP BY ranking;
SELECT price, AVG(review), AVG(rating) FROM Books GROUP BY price;

-- 난이도 있는 문제
SELECT publisher, author, AVG(sales) AS avg_sales FROM Books GROUP BY publisher, author ORDER BY publisher, avg_sales DESC;
SELECT title, review, price FROM Books WHERE review > (SELECT AVG(review) FROM Books) AND price < (SELECT AVG(price) FROM Books);
SELECT author, COUNT(DISTINCT title) AS num_books FROM Books GROUP BY author ORDER BY num_books DESC LIMIT 1;
SELECT author, MAX(sales) AS max_sales FROM Books GROUP BY author;
SELECT month(publishing) AS month, COUNT(*) as num_books, AVG(price) AS AVG_price FROM BOOKS GROUP BY month;
SELECT publisher, COUNT(*), MAX(rating) - MIN(rating) as rating_difference FROM Books GROUP BY publisher HAVING COUNT(*) >= 2 ORDER BY rating_difference DESC;
SELECT title, rating/sales AS ratio FROM Books WHERE author = '자청 저' ORDER BY ratio DESC LIMIT 1;