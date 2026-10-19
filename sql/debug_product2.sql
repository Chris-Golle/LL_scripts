-- Fix 1: Check what post 155269 is
SELECT ID, post_title, post_type, post_status, LEFT(post_content, 300) as content_preview
FROM wp_posts WHERE ID = 155269;

-- Fix 2: Find all wp_template posts that might be hijacking single product
SELECT ID, post_name, post_title, post_status, LEFT(post_content, 200) as content_preview
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_name LIKE '%product%'
ORDER BY post_status, post_name;

-- Fix 3: Check which theme's templates are active
SELECT ID, post_name, post_title, post_status
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_status = 'publish'
ORDER BY post_name;
