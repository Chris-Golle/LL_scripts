UPDATE wp_posts
SET post_content = REPLACE(post_content, 'class="ll-ribbon-soon"', 'class="ll-ribbon-card is-soon"')
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
