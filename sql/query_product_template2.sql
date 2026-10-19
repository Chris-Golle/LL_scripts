-- Check all wp_template posts for single-product, including theme slug
SELECT ID, post_title, post_name, post_status,
  LEFT(post_content, 120) as content_start
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_name LIKE '%product%'
ORDER BY ID DESC;

-- Also check if there's a file-based template in the WooCommerce folder
