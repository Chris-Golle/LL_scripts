-- Fix the single product template slug to match the active theme
-- Changes twentytwentyfour-child → twentytwentyfive-child in all wp_template records

UPDATE wp_posts
SET 
  post_name    = REPLACE(post_name,    'twentytwentyfour-child', 'twentytwentyfive-child'),
  post_content = REPLACE(post_content, 'twentytwentyfour-child', 'twentytwentyfive-child'),
  post_modified = NOW(),
  post_modified_gmt = UTC_TIMESTAMP()
WHERE post_type = 'wp_template'
AND (
  post_name    LIKE '%twentytwentyfour-child%'
  OR post_content LIKE '%twentytwentyfour-child%'
);

-- Also fix template parts
UPDATE wp_posts
SET 
  post_name    = REPLACE(post_name,    'twentytwentyfour-child', 'twentytwentyfive-child'),
  post_content = REPLACE(post_content, 'twentytwentyfour-child', 'twentytwentyfive-child'),
  post_modified = NOW(),
  post_modified_gmt = UTC_TIMESTAMP()
WHERE post_type = 'wp_template_part'
AND (
  post_name    LIKE '%twentytwentyfour-child%'
  OR post_content LIKE '%twentytwentyfour-child%'
);

-- Verify
SELECT ID, post_name, post_type, post_status
FROM wp_posts
WHERE post_type IN ('wp_template','wp_template_part')
AND post_name LIKE '%product%'
ORDER BY post_type, post_name;
