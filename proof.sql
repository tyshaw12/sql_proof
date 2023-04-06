CREATE TABLE TESTQ1 as
-- Write a query that reports all book titles that begin with 'The Art of Computer Programming'. Label the output column "title".
	SELECT title
	FROM books
	WHERE title like "The Art of Computer Programming%";

CREATE TABLE TESTQ2 as
-- Write a query that reports all the book titles that were published by author Donald Knuth. Label the output column "Books by Knuth"
	SELECT B.title as "Books by Knuth"
	FROM books B
	JOIN book_authors BA on B.book_id = BA.book_id
	JOIN authors A on BA.author_id = A.author_id
	WHERE A.first_name = "Donald" AND A.last_name = "Knuth";

CREATE TABLE TESTQ3 as
-- Write a query that reports the number of books that are classified as being in the Comics genre. Label the output column NumComics
	SELECT COUNT(B.book_id) as "NumComics"
	FROM books B
	JOIN book_genres BG on B.book_id = BG.book_id
	JOIN genres G on BG.genre_id = G.genre_id
	WHERE G.genre = "Comics";

CREATE TABLE TESTQ4 as
-- Write a query that reports the top 25 authors ranked by number of books published. Report last_name, first_name, and number of books published as NumBooks.
	SELECT A.last_name, A.first_name, COUNT(A.author_id) as "NumBooks"
	FROM authors A
	JOIN book_authors BA on A.author_id = BA.author_id
	JOIN books B on B.book_id = BA.book_id
	GROUP BY A.author_id
	HAVING B.publisher_id IS NOT NULL
	ORDER BY "NumBooks" DESC
	LIMIT 25;
