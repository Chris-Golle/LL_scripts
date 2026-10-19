-- Get all products to find correct slugs for ribbon buttons
SELECT ID, post_title, post_name, post_status
FROM wp_posts
WHERE post_type = 'product' AND post_status = 'publish'
ORDER BY post_title;
