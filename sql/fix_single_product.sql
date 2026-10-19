-- Fix single-product template: update theme reference
UPDATE wp_posts
SET post_content = REPLACE(post_content, 'twentytwentyfour-child', 'twentytwentyfive-child'),
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 157476;

-- Also fix any other templates still referencing old themes
UPDATE wp_posts
SET post_content = REPLACE(post_content, 'twentytwentyfour-child', 'twentytwentyfive-child'),
    post_name    = REPLACE(post_name,    'twentytwentyfour-child', 'twentytwentyfive-child'),
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE post_type IN ('wp_template', 'wp_template_part')
AND (post_content LIKE '%twentytwentyfour-child%' OR post_name LIKE '%twentytwentyfour-child%');

-- Verify
SELECT ID, post_name, LEFT(post_content, 200) as preview
FROM wp_posts WHERE ID = 157476;
