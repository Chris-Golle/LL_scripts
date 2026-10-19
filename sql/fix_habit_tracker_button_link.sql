-- Fix inoperant 'Get your habit tracker' button on Step by Step page (ID 7480)
-- Adds missing href, linking to Habit Tracker 21 Days product (ID 157457)

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '"spacing":{"padding":{"left":"var:preset|spacing|50","right":"var:preset|spacing|50","top":"var:preset|spacing|50","bottom":"var:preset|spacing|50"}}},"fontSize":"large"} -->
<div class="wp-block-button"><a class="wp-block-button__link has-text-align-center has-large-font-size has-custom-font-size wp-element-button" style="padding-top:var(--wp--preset--spacing--50);padding-right:var(--wp--preset--spacing--50);padding-bottom:var(--wp--preset--spacing--50);padding-left:var(--wp--preset--spacing--50)">Get your habit tracker <br>handcrafted · Baltic birch</a></div>
<!-- /wp:button -->',
  '"spacing":{"padding":{"left":"var:preset|spacing|50","right":"var:preset|spacing|50","top":"var:preset|spacing|50","bottom":"var:preset|spacing|50"}}},"url":"/shop/habit-tracker-21-days/","fontSize":"large"} -->
<div class="wp-block-button"><a class="wp-block-button__link has-text-align-center has-large-font-size has-custom-font-size wp-element-button" href="/shop/habit-tracker-21-days/" style="padding-top:var(--wp--preset--spacing--50);padding-right:var(--wp--preset--spacing--50);padding-bottom:var(--wp--preset--spacing--50);padding-left:var(--wp--preset--spacing--50)">Get your habit tracker <br>handcrafted · Baltic birch</a></div>
<!-- /wp:button -->'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
