UPDATE wp_posts
SET
    post_content      = '<!-- wp:template-part {"slug":"header","theme":"twentytwentyfive-child","tagName":"header"} /-->

<!-- wp:group {"tagName":"main"} -->
<main class="wp-block-group ll-cat-template">

<!-- wp:group {"align":"full","className":"ll-section ll-section--light ll-cat-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light ll-cat-hero">

<!-- wp:query-title {"type":"archive","showPrefix":false,"textAlign":"center"} /-->

<!-- wp:group {"className":"ll-dictionary ll-mode-bloom ll-panel","tagName":"div"} -->
<div class="wp-block-group ll-dictionary ll-mode-bloom ll-panel">

<!-- wp:buttons {"className":"ll-strength-toggle"} -->
<div class="wp-block-buttons ll-strength-toggle">
<!-- wp:button {"className":"ll-toggle-btn ll-toggle--bloom ll-toggle-active","tagName":"button"} -->
<div class="wp-block-button"><button class="wp-block-button__link wp-element-button ll-toggle-btn ll-toggle--bloom ll-toggle-active">&#x1F338; I have this strength, I want to let it bloom</button></div>
<!-- /wp:button -->
<!-- wp:button {"className":"ll-toggle-btn ll-toggle--seed","tagName":"button"} -->
<div class="wp-block-button"><button class="wp-block-button__link wp-element-button ll-toggle-btn ll-toggle--seed">&#x1F331; I want to water the seed of this strength</button></div>
<!-- /wp:button -->
</div>
<!-- /wp:buttons -->

<!-- wp:shortcode -->[ll_strength_description]<!-- /wp:shortcode -->

</div>
<!-- /wp:group -->

</div>
<!-- /wp:group -->

<!-- wp:woocommerce/store-notices /-->

<!-- wp:woocommerce/product-collection {"queryId":3,"query":{"perPage":9,"pages":0,"offset":0,"postType":"product","order":"asc","orderBy":"title","inherit":true,"isProductCollectionBlock":true,"woocommerceStockStatus":["instock","outofstock","onbackorder"]},"tagName":"div","displayLayout":{"type":"flex","columns":3,"shrinkColumns":true},"dimensions":{"widthType":"fill"},"queryContextIncludes":["collection"],"align":"wide"} -->
<div class="wp-block-woocommerce-product-collection alignwide ll-product-grid">

<!-- wp:woocommerce/product-template -->
<!-- wp:woocommerce/product-image {"showSaleBadge":false,"imageSizing":"thumbnail"} --><div class="is-loading"></div><!-- /wp:woocommerce/product-image -->
<!-- wp:post-title {"textAlign":"center","isLink":true,"style":{"spacing":{"margin":{"bottom":"0.75rem","top":"0"}},"typography":{"lineHeight":"1.4"}},"fontSize":"medium","__woocommerceNamespace":"woocommerce/product-collection/product-title"} /-->
<!-- wp:woocommerce/product-price {"textAlign":"center","fontSize":"small"} --><div class="is-loading"></div><!-- /wp:woocommerce/product-price -->
<!-- wp:woocommerce/product-button {"textAlign":"center","fontSize":"small"} /-->
<!-- /wp:woocommerce/product-template -->

<!-- wp:query-pagination {"layout":{"type":"flex","justifyContent":"center"}} -->
<!-- wp:query-pagination-previous /--><!-- wp:query-pagination-numbers /--><!-- wp:query-pagination-next /-->
<!-- /wp:query-pagination -->

<!-- wp:woocommerce/product-collection-no-results -->
<!-- wp:paragraph {"fontSize":"medium"} --><p class="has-medium-font-size"><strong>No results found</strong></p><!-- /wp:paragraph -->
<!-- /wp:woocommerce/product-collection-no-results -->

</div>
<!-- /wp:woocommerce/product-collection -->

</main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"footer","theme":"twentytwentyfive-child","tagName":"footer"} /-->',
    post_modified     = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 158583;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
