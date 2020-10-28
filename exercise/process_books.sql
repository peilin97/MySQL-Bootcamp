-- evaluate the following ...
SELECT 10 != 10;  # 0
SELECT 15 > 14 && 99-5 <= 94;  # 1
SELECT 1 IN (5, 3) || 9 BETWEEN 8 AND 10;  # 1

-- select all books written before 1980 (non inclusive)
SELECT *
FROM books
WHERE released_year < 1980;

-- select all books written by Eggers or Chabon
SELECT *
FROM books
WHERE author_lname in ('Eggers', 'Chabon');

-- select all books written by Lahiri, published after 2000
SELECT *
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- select all books with page counts between 100 and 200
SELECT title, pages
FROM books
WHERE pages BETWEEN 100 AND 200;

-- select all books where author_lname starts with a 'C' or an 'S'
SELECT *
FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');

-- case statements
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title='Just Kids' OR title='A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

SELECT title, author_lname,
CASE WHEN COUNT(*)=1 THEN '1 book'
ELSE CONCAT(COUNT(*), ' books')
END AS COUNT
FROM books
GROUP BY author_lname, author_fname;

# -- Print the number of books in the database
# SELECT COUNT(*)
# FROM books;

# -- Print out how many books were released in each year
# SELECT released_year, COUNT(*)
# FROM books
# GROUP BY released_year;

# -- Print out the total number of books in stock
# SELECT SUM(stock_quantity)
# FROM books;

# -- Find the average released_year for each author
# SELECT author_fname, author_lname, AVG(released_year)
# FROM books
# GROUP BY author_lname, author_fname;

# -- Find the full name of the author who wrote the longest book
# SELECT CONCAT(author_fname, " ", author_lname) AS "author"
# FROM books
# ORDER BY pages DESC
# LIMIT 1;

# SELECT released_year AS "year", COUNT(*) AS "#books", AVG(pages) AS "avg pages"
# FROM books
# GROUP BY released_year;

# -- Calculate the average stock quantity for books released in the same year
# SELECT released_year, AVG(stock_quantity)
# FROM books
# GROUP BY released_year;

# -- Sum all pages each author has written
# SELECT author_fname, author_lname, SUM(pages)
# FROM books
# GROUP BY author_lname, author_fname;

# -- Find the longest page count for each author
# SELECT author_fname, author_lname, MAX(pages)
# FROM books
# GROUP BY author_lname, author_fname;

# -- Find the year each author published their first book
# SELECT author_fname, author_lname, MIN(released_year)
# FROM books
# GROUP BY author_lname, author_fname;

# SELECT title
# FROM books
# WHERE title LIKE "%stories%";

# SELECT title, pages
# FROM books
# ORDER BY pages DESC
# LIMIT 1;

# SELECT CONCAT(title, " - ", released_year) AS summary
# FROM books
# ORDER BY released_year DESC
# LIMIT 3;

# SELECT title, author_lname
# FROM books
# WHERE author_lname LIKE "% %";

# SELECT title, released_year, stock_quantity
# FROM books
# ORDER BY stock_quantity
# LIMIT 3;

# SELECT title, author_lname
# FROM books
# ORDER BY author_lname, title;

# SELECT CONCAT("MY FAVORITE AUTHOR IS ", UPPER(author_fname), " ", UPPER(author_lname), "!") AS "yell"
# FROM books
# ORDER BY author_lname;

# SELECT
# REPLACE(title, " ", "->") AS 'titles'
# FROM books;

# SELECT
# author_lname AS 'forwards',
# REVERSE(author_lname) AS 'backwards'
# FROM books;

# SELECT
# UPPER(CONCAT(author_fname, " ", author_lname)) AS 'full name in caps'
# FROM books;

# SELECT
# CONCAT_WS(" ", title, "was released in", released_year) AS blurb
# FROM books;

# SELECT
# title,
# CHAR_LENGTH(title) AS "character length"
# FROM books;

# SELECT
# CONCAT(SUBSTR(title, 1, 10), "...") AS "short title",
# CONCAT(author_lname, ",", author_fname) AS "author",
# CONCAT(stock_quantity, " in stock") AS "quantity"
# FROM books;
