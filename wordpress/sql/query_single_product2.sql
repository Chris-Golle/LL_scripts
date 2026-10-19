-- Find ALL single-product templates across all themes
SELECT ID, post_title, post_name, post_status,
  SUBSTRING(post_content, 1, 150) as content_start
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_name = 'single-product'
ORDER BY ID DESC;

-- Check which theme slug is referenced in the active template
SELECT ID, post_title,
  SUBSTRING(post_content, 1, 300) as content_start
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_name = 'single-product'
AND post_status = 'publish'
ORDER BY ID DESC;
