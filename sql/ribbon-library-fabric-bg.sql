UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '{"align":"full","className":"ll-section ll-section\\u002d\\u002dwhite","layout":{"type":"constrained"},"anchor":"ll-ribbons"}',
  '{"align":"full","className":"ll-section ll-section\\u002d\\u002dfabric","layout":{"type":"constrained"},"anchor":"ll-ribbons"}'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  'class="wp-block-group alignfull ll-section ll-section--white" id="ll-ribbons"',
  'class="wp-block-group alignfull ll-section ll-section--fabric" id="ll-ribbons"'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
