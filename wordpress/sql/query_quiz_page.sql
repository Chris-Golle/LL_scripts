-- Check what the quiz page looks like
SELECT ID, post_title, LEFT(post_content, 2000) as content FROM wp_posts WHERE post_name = 'wear-your-strength' AND post_type = 'page';
