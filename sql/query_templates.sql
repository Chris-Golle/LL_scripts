SELECT ID, post_title, post_type, post_name, LEFT(post_content,200) as content_preview
FROM wp_posts
WHERE post_type IN ('wp_template_part','wp_template','page')
  AND post_status != 'auto-draft'
  AND (post_type != 'page' OR post_name LIKE '%planet%' OR post_name LIKE '%footer%')
ORDER BY post_type, post_title
LIMIT 40;
