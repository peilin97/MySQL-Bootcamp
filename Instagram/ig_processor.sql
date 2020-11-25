-- Find the 5 oldest users.
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- What day of the week do most users register on?
-- We need to figure out when to schedule an ad campgain
SELECT
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY DAYNAME(created_at)
ORDER BY COUNT(*) DESC;

-- We want to target our inactive users with an email campaign.
-- Find the users who have never posted a photo
SELECT users.id, username, users.created_at
FROM users
LEFT JOIN photos
    ON photos.user_id = users.id
WHERE photos.id is NULL;

-- who can get the most likes on a single photo.
SELECT
    photos.id AS photo_id,
    users.id AS user_id,
    username,
    image_url,
    COUNT(likes.photo_id) AS 'likes'
FROM photos
JOIN likes
    ON likes.photo_id = photos.id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT(likes.photo_id) DESC
LIMIT 1;

-- How many times does the average user post?
SELECT
    (SELECT COUNT(*) FROM photos) /
    (SELECT COUNT(*) FROM users)
AS avg_photos;

-- What are the top 5 most commonly used hashtags?
SELECT
    tag_name,
    COUNT(tag_id)
FROM tags
JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY COUNT(tag_id) DESC
LIMIT 5;
    
-- We have a small problem with bots on our site...
-- Find users who have liked every single photo on the site
SELECT
    users.id,
    users.username,
    COUNT(*) AS total
FROM users
JOIN likes
    ON likes.user_id = users.id
GROUP BY users.id
HAVING total = (SELECT COUNT(*) FROM photos);
