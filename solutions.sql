--Find all subjects sorted by subject
SELECT * FROM subjects
	ORDER BY subject;

--Find all subjects sorted by location
SELECT * FROM subjects
	ORDER BY location;

--Find the book "Little Women"
SELECT * FROM books
	WHERE title = 'Little Women';

--Find all books containing the word "Python"
SELECT * FROM books
	WHERE title LIKE '%Python%';

--Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects
	WHERE location = 'Main St'
	ORDER BY subject;

--Find all books about Computers list ONLY book title
SELECT books.title FROM books
	LEFT JOIN subjects
	ON books.subject_id = subjects.id
	WHERE subjects.subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns
--		Book title
--		Author's first name
--		Author's last name
--		Book subject
SELECT b.title, a.first_name, a.last_name, s.subject from books b
	LEFT JOIN authors a ON b.author_id = a.id
	LEFT JOIN subjects s ON b.subject_id = s.id;

--Find all books that are listed in the stock table
--		Sort them by retail price (most expensive first)
--		Display ONLY: title and price
SELECT bk.title, st.retail FROM stock st
	LEFT JOIN editions ed ON st.isbn = ed.isbn
	LEFT JOIN books bk ON ed.book_id = bk.id
	ORDER BY retail;

--Find the book "Dune" and display ONLY the following columns
--		Book title
--		ISBN number
--		Publisher name
--		Retail price

SELECT bk.title, ed.isbn, pb.name, st.retail from books bk
	LEFT JOIN editions ed ON ed.book_id = bk.id
	LEFT JOIN publishers pb ON ed.publisher_id = pb.id
	LEFT JOIN stock st ON ed.isbn = st.isbn
	WHERE title = 'Dune';

--Find all shipments sorted by ship date display a result table with ONLY the following columns:
--	Customer first name
--	Customer last name
--	ship date
--	book title

SELECT cu.first_name, cu.last_name, sh.ship_date, bk.title FROM shipments sh
	LEFT JOIN customers cu ON sh.customer_id = cu.id
	LEFT JOIN editions ed ON sh.isbn = ed.isbn
	LEFT JOIN books bk on ed.book_id = bk.id
	ORDER BY sh.ship_date;

--Get the COUNT of all books
SELECT COUNT(*) FROM books;

--Get the COUNT of all Locations
SELECT count(*) FROM subjects;

--Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(*) FROM subjects
	GROUP BY location;

--List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT bk.title, count(*) AS "Number of Editions" FROM books bk
	JOIN editions ed ON bk.id = ed.book_id
	GROUP BY bk.title;
