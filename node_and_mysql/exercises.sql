-- Find Earliest Date A User Joined
SELECT
    DATE_FORMAT(MIN(created_at), "%M %D %Y") AS earliest_date
FROM users;

-- Find Email Of The First (Earliest)User
SELECT * 
FROM   users 
WHERE  created_at = (SELECT Min(created_at) 
                     FROM   users); 

-- Users According To The Month They Joined
SELECT
    Monthname(created_at) AS month,
    COUNT(*) AS count
FROM users
GROUP BY Monthname(created_at)
ORDER BY COUNT(*) DESC;

-- Count Number of Users With Yahoo Emails
SELECT
    COUNT(*) AS "yahoo_users"
FROM users
WHERE email LIKE "%yahoo.com";

-- Calculate Total Number of Users for Each Email Host
SELECT
    CASE
         WHEN email LIKE '%@gmail.com' THEN 'gmail'
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
         ELSE 'other'
       end AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;