-- What template is WordPress actually using for product pages?
SELECT p.ID, p.post_title, p.post_name, p.post_type,
  t.name as theme, pm.meta_value as template
FROM wp_posts p
LEFT JOIN wp_postmeta pm ON p.ID = pm.post_id AND pm.meta_key = '_wp_page_template'
LEFT JOIN wp_terms t ON 1=0
WHERE p.post_type = 'wp_template'
AND p.post_name = 'single-product'
ORDER BY p.ID DESC;

-- Also check if there's a product-type specific template
SELECT ID, post_title, post_name, post_status,
  SUBSTRING(post_content, 1, 100) as start
FROM wp_posts
WHERE post_type = 'wp_template'
AND post_status = 'publish'
AND post_name LIKE '%single%'
ORDER BY ID DESC;
