-- 1. Add space in #remember text
UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<span>Remember that you are </span>',
  '<span>Remember that you are &nbsp;</span>'
)
WHERE post_name = 'wear-your-strength'
  AND post_status = 'publish';

-- 2. Change last section className (JSON attribute)
UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '"className":"ll-s-light"',
  '"className":"ll-s1"'
)
WHERE post_name = 'wear-your-strength'
  AND post_status = 'publish';

-- 3. Change last section rendered class (HTML div)
UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  'class="wp-block-group alignfull ll-s-light"',
  'class="wp-block-group alignfull ll-s1"'
)
WHERE post_name = 'wear-your-strength'
  AND post_status = 'publish';
