-- What template is assigned to ribbon products?
SELECT p.ID, p.post_title, pm.meta_key, pm.meta_value
FROM wp_posts p
JOIN wp_postmeta pm ON p.ID = pm.post_id
WHERE p.post_type = 'product'
AND pm.meta_key = '_wp_page_template'
LIMIT 10;

-- Also check if there's a product-specific template override
SELECT p.ID, p.post_title, pm.meta_value
FROM wp_posts p
LEFT JOIN wp_postmeta pm ON p.ID = pm.post_id AND pm.meta_key = '_wp_page_template'
WHERE p.post_type = 'product'
AND p.post_status = 'publish'
LIMIT 10;
