-- Remove injected wp:html buy-cta-wrap block and ll-buy-card class from block button
UPDATE wp_posts
SET post_content = REPLACE(
  REPLACE(
    REPLACE(
      post_content,
      '\n<!-- wp:html -->\n<div class="ll-buy-cta-wrap">\n  <div class="ll-buy-card" data-product-url="https://www.lullberry.com/product/habit-tracker-21-days/" role="button" tabindex="0">\n    <span class="ll-buy-card-title">Get your habit tracker</span>\n    <span class="ll-buy-card-meta">handcrafted &middot; Baltic birch</span>\n  </div>\n</div>\n<!-- /wp:html -->',
      ''
    ),
    '"className":"ll-buy-card",',
    ''
  ),
  'class="wp-block-button ll-buy-card"',
  'class="wp-block-button"'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
