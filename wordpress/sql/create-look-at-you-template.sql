-- ============================================================
-- 1. Revert taxonomy-product_cat to clean legacy template
-- ============================================================
UPDATE wp_posts
SET
    post_content = '<!-- wp:template-part {"slug":"header","theme":"twentytwentyfive-child","tagName":"header"} /-->\n\n<!-- wp:group {"tagName":"main"} -->\n<main class="wp-block-group"><!-- wp:woocommerce/legacy-template {"template":"taxonomy-product_cat"} /--></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {"slug":"footer","theme":"twentytwentyfive-child","tagName":"footer"} /-->',
    post_modified     = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 156917;

-- ============================================================
-- 2. Insert taxonomy-product_cat-look-at-you template
--    (modern blocks; term-description is a placeholder until
--     the [ll_strength_description] shortcode is ready)
-- ============================================================
INSERT INTO wp_posts (
    post_author,
    post_date,
    post_date_gmt,
    post_content,
    post_title,
    post_excerpt,
    post_status,
    comment_status,
    ping_status,
    post_name,
    post_modified,
    post_modified_gmt,
    post_content_filtered,
    post_parent,
    guid,
    menu_order,
    post_type,
    post_mime_type,
    comment_count
) VALUES (
    3,
    NOW(),
    UTC_TIMESTAMP(),
    '<!-- wp:template-part {"slug":"header","theme":"twentytwentyfive-child","tagName":"header"} /-->\n\n<!-- wp:group {"tagName":"main"} -->\n<main class="wp-block-group"><!-- wp:woocommerce/breadcrumbs /-->\n\n<!-- wp:query-title {"type":"archive","showPrefix":false,"align":"wide"} /-->\n\n<!-- wp:term-description {"align":"wide"} /-->\n\n<!-- wp:woocommerce/store-notices /-->\n\n<!-- wp:woocommerce/product-collection {"queryId":3,"query":{"perPage":9,"pages":0,"offset":0,"postType":"product","order":"asc","orderBy":"title","search":"","exclude":[],"inherit":true,"taxQuery":[],"isProductCollectionBlock":true,"featured":false,"woocommerceOnSale":false,"woocommerceStockStatus":["instock","outofstock","onbackorder"],"woocommerceAttributes":[],"woocommerceHandPickedProducts":[],"filterable":false,"relatedBy":{"categories":true,"tags":true}},"tagName":"div","displayLayout":{"type":"flex","columns":3,"shrinkColumns":true},"dimensions":{"widthType":"fill"},"queryContextIncludes":["collection"],"__privatePreviewState":{"isPreview":true,"previewMessage":"Actual products will vary depending on the page being viewed."},"align":"wide"} -->\n<div class="wp-block-woocommerce-product-collection alignwide"><!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {"showSaleBadge":false,"imageSizing":"thumbnail"} -->\n<div class="is-loading"></div>\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {"textAlign":"center","isLink":true,"style":{"spacing":{"margin":{"bottom":"0.75rem","top":"0"}},"typography":{"lineHeight":"1.4"}},"fontSize":"medium","__woocommerceNamespace":"woocommerce/product-collection/product-title"} /-->\n\n<!-- wp:woocommerce/product-price {"textAlign":"center","fontSize":"small"} -->\n<div class="is-loading"></div>\n<!-- /wp:woocommerce/product-price -->\n\n<!-- wp:woocommerce/product-button {"textAlign":"center","fontSize":"small"} /-->\n<!-- /wp:woocommerce/product-template -->\n\n<!-- wp:query-pagination {"layout":{"type":"flex","justifyContent":"center"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-numbers /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination -->\n\n<!-- wp:woocommerce/product-collection-no-results -->\n<!-- wp:group {"layout":{"type":"flex","orientation":"vertical","justifyContent":"center","flexWrap":"wrap"}} -->\n<div class="wp-block-group"><!-- wp:paragraph {"fontSize":"medium"} -->\n<p class="has-medium-font-size"><strong>No results found</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>You can try <a href="#" class="wc-link-clear-any-filters">clearing any filters</a> or head to our <a href="#" class="wc-link-stores-home">store\'s home</a></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n<!-- /wp:woocommerce/product-collection-no-results --></div>\n<!-- /wp:woocommerce/product-collection --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {"slug":"footer","theme":"twentytwentyfive-child","tagName":"footer"} /-->',
    'Products by Category: Look at You',
    '',
    'publish',
    'closed',
    'closed',
    'taxonomy-product_cat-look-at-you',
    NOW(),
    UTC_TIMESTAMP(),
    '',
    0,
    'http://lullberry.local',
    0,
    'wp_template',
    '',
    0
);

-- ============================================================
-- 3. Tag the new template as user-created
-- ============================================================
INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
VALUES (LAST_INSERT_ID(), 'origin', 'custom');

-- ============================================================
-- 4. Clear template cache
-- ============================================================
DELETE FROM wp_options WHERE option_name LIKE '%transient%';
