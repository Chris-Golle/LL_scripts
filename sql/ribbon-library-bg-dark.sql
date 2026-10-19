UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '{"align":"full","className":"ll-section ll-section\\u002d\\u002dfabric","layout":{"type":"constrained"},"anchor":"ll-ribbons"} -->\n<div class="wp-block-group alignfull ll-section ll-section--fabric" id="ll-ribbons">',
  '{"align":"full","className":"ll-section ll-section\\u002d\\u002dfabric ll-bg-dark","layout":{"type":"constrained"},"anchor":"ll-ribbons"} -->\n<div class="wp-block-group alignfull ll-section ll-section--fabric ll-bg-dark" id="ll-ribbons">'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
