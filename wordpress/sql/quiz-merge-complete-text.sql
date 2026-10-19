UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<!-- wp:paragraph {"className":"quiz-ready","style":{"typography":{"textAlign":"center"}}} -->\n<p class="has-text-align-center quiz-ready">Your results are ready!</p>\n<!-- /wp:paragraph -->\n\n',
  ''
)
WHERE ID = 158541;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
