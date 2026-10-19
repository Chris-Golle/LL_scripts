UPDATE wp_posts
SET post_content = REPLACE(post_content, '<!-- wp:buttons -->
<div class="wp-block-buttons"><!-- wp:button {"className":"ll-buy-card product-fullscreen-button"} -->
<div class="wp-block-button ll-buy-card product-fullscreen-button"><a class="wp-block-button__link wp-element-button" href="http://lullberry.local/">Get your habit tracker<br>Handcrafted · Baltic birch</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->

<!-- wp:html -->
<div class="ll-buy-cta-wrap">
  <button class="ll-buy-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/habit-tracker-21-days/">
    <span class="ll-buy-card-title">Get your habit tracker</span>
    <span class="ll-buy-card-meta">handcrafted &middot; Baltic birch</span>
  </button>
</div>
<!-- /wp:html -->', '<!-- wp:html -->
<div class="ll-buy-cta-wrap">
  <button class="ll-buy-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/habit-tracker-21-days/">
    <span class="ll-buy-card-title">Get your habit tracker</span>
    <span class="ll-buy-card-meta">handcrafted &middot; Baltic birch</span>
  </button>
</div>
<!-- /wp:html -->')
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
