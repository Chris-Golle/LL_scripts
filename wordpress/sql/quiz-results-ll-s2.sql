-- Change quiz-results section from ll-s1 to ll-s2
UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '"className":"ll-s1 quiz-taken quiz-results"',
  '"className":"ll-s2 quiz-taken quiz-results"'
)
WHERE post_name = 'wear-your-strength'
  AND post_status = 'publish';

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  'class="wp-block-group alignfull ll-s1 quiz-taken quiz-results',
  'class="wp-block-group alignfull ll-s2 quiz-taken quiz-results'
)
WHERE post_name = 'wear-your-strength'
  AND post_status = 'publish';
