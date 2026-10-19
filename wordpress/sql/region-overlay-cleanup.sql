UPDATE wp_posts SET post_content = '<!-- wp:cover {"url":"https://www.lullberry.com/wp-content/uploads/gratitude.jpg","id":154388,"hasParallax":true,"dimRatio":0,"minHeight":100,"minHeightUnit":"vh","isDark":false,"align":"full","fontSize":"medium","anchor":"change_region"} -->
<div class="wp-block-cover alignfull is-light has-parallax has-medium-font-size" style="min-height:100vh" id="change_region"><div class="wp-block-cover__image-background wp-image-154388 has-parallax" style="background-position:50% 50%;background-image:url(https://www.lullberry.com/wp-content/uploads/gratitude.jpg)"></div><span aria-hidden="true" class="wp-block-cover__background has-background-dim-0 has-background-dim"></span><div class="wp-block-cover__inner-container"><!-- wp:group {"className":"ll-panel","anchor":"region-content"} -->
<div id="region-content" class="wp-block-group ll-panel"><!-- wp:buttons {"layout":{"type":"flex","orientation":"vertical","justifyContent":"right"},"anchor":"close-region"} -->
<div class="wp-block-buttons" id="close-region"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button">X</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->
<!-- wp:paragraph {"className":"ll-panel-text","fontSize":"large"} -->
<p class="ll-panel-text has-large-font-size">Where on this lovely planet are you?</p>
<!-- /wp:paragraph -->
<!-- wp:paragraph {"className":"ll-field-label"} -->
<p class="ll-field-label">Region</p>
<!-- /wp:paragraph -->
<!-- wp:buttons {"className":"ll-region-chips ll-chip-grid","layout":{"type":"flex","flexWrap":"wrap"}} -->
<div class="wp-block-buttons ll-region-chips ll-chip-grid"><!-- wp:button {"anchor":"region-USA"} -->
<div class="wp-block-button" id="region-USA"><a class="wp-block-button__link wp-element-button" href="?region=usa">USA</a></div>
<!-- /wp:button --><!-- wp:button {"anchor":"region-Europe"} -->
<div class="wp-block-button" id="region-Europe"><a class="wp-block-button__link wp-element-button" href="?region=europe">Europe</a></div>
<!-- /wp:button --><!-- wp:button {"anchor":"region-Canada"} -->
<div class="wp-block-button" id="region-Canada"><a class="wp-block-button__link wp-element-button" href="?region=canada">Canada</a></div>
<!-- /wp:button --><!-- wp:button {"anchor":"region-Australia"} -->
<div class="wp-block-button" id="region-Australia"><a class="wp-block-button__link wp-element-button" href="?region=oz-nz">Australia</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->
<!-- wp:paragraph {"className":"ll-field-label"} -->
<p class="ll-field-label">Currency</p>
<!-- /wp:paragraph -->
<!-- wp:shortcode -->
[currency_switcher]
<!-- /wp:shortcode -->
<!-- wp:buttons -->
<div class="wp-block-buttons"><!-- wp:button {"anchor":"ll-region-confirm"} -->
<div class="wp-block-button" id="ll-region-confirm"><a class="wp-block-button__link wp-element-button">Confirm</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group --></div></div>
<!-- /wp:cover -->' WHERE ID = 158569;
DELETE FROM wp_options WHERE option_name LIKE '%transient%';
