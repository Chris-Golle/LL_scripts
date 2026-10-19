-- Remove product image gallery from single-product template
-- Replace two-column layout with single column (form only), let animation be the visual

UPDATE wp_posts
SET post_content = '<!-- wp:template-part {"slug":"header","theme":"twentytwentyfive-child","tagName":"header","area":"header"} /-->

<!-- wp:group {"tagName":"main","layout":{"type":"constrained"}} -->
<main class="wp-block-group">

<!-- wp:woocommerce/store-notices /-->

<!-- wp:group {"align":"full","className":"lb-s1 lb-product-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-s1 lb-product-hero"><!-- wp:columns {"verticalAlignment":"center"} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column {"width":"55%"} -->
<div class="wp-block-column" style="flex-basis:55%"><!-- wp:post-title {"level":1,"__woocommerceNamespace":"woocommerce/product-query/product-title"} /-->

<!-- wp:woocommerce/product-price {"isDescendentOfSingleProductTemplate":true} /-->

<!-- wp:post-excerpt {"__woocommerceNamespace":"woocommerce/product-query/product-summary"} /-->

<!-- wp:woocommerce/add-to-cart-form /--></div>
<!-- /wp:column -->

<!-- wp:column {"width":"45%","className":"lb-product-img-col"} -->
<div class="wp-block-column lb-product-img-col" style="flex-basis:45%"><!-- wp:woocommerce/product-image-gallery /--></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"lb-product-animation-band","layout":{"type":"full"}} -->
<div class="wp-block-group alignfull lb-product-animation-band"><!-- wp:shortcode -->
[board_animation]
<!-- /wp:shortcode --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"lb-planet-section lb-planet-light","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-planet-section lb-planet-light"><!-- wp:woocommerce/product-details -->
<div class="wp-block-woocommerce-product-details alignwide"></div>
<!-- /wp:woocommerce/product-details --></div>
<!-- /wp:group -->

</main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"footer","theme":"twentytwentyfive-child","tagName":"footer","area":"footer"} /-->',
post_modified = NOW(),
post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 157476;
