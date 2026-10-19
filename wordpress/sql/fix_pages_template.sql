-- Fix the "Pages" FSE template (ID 158034)
-- Remove constrained layout so wp:html blocks render full-width.

UPDATE `wp_posts`
SET `post_content` = '<!-- wp:template-part {"slug":"ll-header","theme":"twentytwentyfive-child"} /-->

<!-- wp:group {"tagName":"main","style":{"spacing":{"margin":{"top":"0"}}},"layout":{"type":"default"}} -->
<main class="wp-block-group" style="margin-top:0"><!-- wp:post-content {"align":"full","layout":{"type":"default"}} /--></main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"ll-footer","theme":"twentytwentyfive-child"} /-->',
`post_modified` = NOW(),
`post_modified_gmt` = UTC_TIMESTAMP()
WHERE `ID` = 158034;
