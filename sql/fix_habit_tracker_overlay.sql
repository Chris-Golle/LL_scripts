-- Wire 'Get your habit tracker' button into the shared product-overlay
-- mechanism (same click handler + close button + no-header behavior the
-- ribbon cards already use), and correct the product path to /product/
-- (the /shop/ base was never real -- confirmed against every ll-ribbon-card
-- link on this same page).

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '":"var:preset|spacing|50","top":"var:preset|spacing|50","bottom":"var:preset|spacing|50"}}},"url":"/shop/habit-tracker-21-days/","fontSize":"large"} -->
<div class="wp-block-button"><a class="wp-block-button__link has-text-align-center has-large-font-size has-custom-font-size wp-element-button" href="/shop/habit-tracker-21-days/" style="padding-top:var(--wp--preset--spacing--50);padding-right:var(--wp--preset--spacing--50);padding-bottom:var(--wp--preset--spacing--50);padding-left:var(--wp--preset--spacing--50)">Get your habit tracker <br>handcrafted · Baltic birch</a></div>
<!-- /wp:button -->',
  '":"var:preset|spacing|50","top":"var:preset|spacing|50","bottom":"var:preset|spacing|50"}}},"url":"https://www.lullberry.com/product/habit-tracker-21-days/","fontSize":"large","className":"ll-buy-card"} -->
<div class="wp-block-button ll-buy-card"><a class="wp-block-button__link has-text-align-center has-large-font-size has-custom-font-size wp-element-button ll-buy-card" data-product-url="https://www.lullberry.com/product/habit-tracker-21-days/" href="https://www.lullberry.com/product/habit-tracker-21-days/" style="padding-top:var(--wp--preset--spacing--50);padding-right:var(--wp--preset--spacing--50);padding-bottom:var(--wp--preset--spacing--50);padding-left:var(--wp--preset--spacing--50)">Get your habit tracker <br>handcrafted · Baltic birch</a></div>
<!-- /wp:button -->'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
