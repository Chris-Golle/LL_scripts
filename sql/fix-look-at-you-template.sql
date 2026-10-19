-- Update taxonomy-product_cat-look-at-you (ID 158583) with modern blocks
UPDATE wp_posts
SET
    post_content      = '<!-- wp:template-part {"slug":"header","theme":"twentytwentyfive-child","tagName":"header"} /-->

<!-- wp:group {"tagName":"main"} -->
<main class="wp-block-group ll-cat-template"><!-- wp:woocommerce/breadcrumbs /-->

<!-- wp:group {"align":"full","className":"ll-section ll-section--light ll-cat-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light ll-cat-hero"><!-- wp:query-title {"type":"archive","showPrefix":false,"textAlign":"center"} /-->

<!-- wp:term-description {"align":"wide"} /-->
</div>
<!-- /wp:group -->

<!-- wp:woocommerce/store-notices /-->

<!-- wp:woocommerce/product-collection {"queryId":3,"query":{"perPage":9,"pages":0,"offset":0,"postType":"product","order":"asc","orderBy":"title","search":"","exclude":[],"inherit":true,"taxQuery":[],"isProductCollectionBlock":true,"featured":false,"woocommerceOnSale":false,"woocommerceStockStatus":["instock","outofstock","onbackorder"],"woocommerceAttributes":[],"woocommerceHandPickedProducts":[],"filterable":false,"relatedBy":{"categories":true,"tags":true}},"tagName":"div","displayLayout":{"type":"flex","columns":3,"shrinkColumns":true},"dimensions":{"widthType":"fill"},"queryContextIncludes":["collection"],"__privatePreviewState":{"isPreview":true,"previewMessage":"Actual products will vary depending on the page being viewed."},"align":"wide"} -->
<div class="wp-block-woocommerce-product-collection alignwide ll-product-grid"><!-- wp:woocommerce/product-template -->
<!-- wp:woocommerce/product-image {"showSaleBadge":false,"imageSizing":"thumbnail"} -->
<div class="is-loading"></div>
<!-- /wp:woocommerce/product-image -->

<!-- wp:post-title {"textAlign":"center","isLink":true,"style":{"spacing":{"margin":{"bottom":"0.75rem","top":"0"}},"typography":{"lineHeight":"1.4"}},"fontSize":"medium","__woocommerceNamespace":"woocommerce/product-collection/product-title"} /-->

<!-- wp:woocommerce/product-price {"textAlign":"center","fontSize":"small"} -->
<div class="is-loading"></div>
<!-- /wp:woocommerce/product-price -->

<!-- wp:woocommerce/product-button {"textAlign":"center","fontSize":"small"} /-->
<!-- /wp:woocommerce/product-template -->

<!-- wp:query-pagination {"layout":{"type":"flex","justifyContent":"center"}} -->
<!-- wp:query-pagination-previous /-->

<!-- wp:query-pagination-numbers /-->

<!-- wp:query-pagination-next /-->
<!-- /wp:query-pagination -->

<!-- wp:woocommerce/product-collection-no-results -->
<!-- wp:group {"layout":{"type":"flex","orientation":"vertical","justifyContent":"center","flexWrap":"wrap"}} -->
<div class="wp-block-group"><!-- wp:paragraph {"fontSize":"medium"} -->
<p class="has-medium-font-size"><strong>No results found</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You can try <a href="#" class="wc-link-clear-any-filters">clearing any filters</a> or head to our <a href="#" class="wc-link-stores-home">store''s home</a></p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->
<!-- /wp:woocommerce/product-collection-no-results --></div>
<!-- /wp:woocommerce/product-collection --></main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"footer","theme":"twentytwentyfive-child","tagName":"footer"} /-->',
    post_title        = 'Products by Category: Look at You',
    post_modified     = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 158583;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
