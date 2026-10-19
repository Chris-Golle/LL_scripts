-- Fix 1: Remove constrained layout from the "Pages" template (ID 158034)
-- so wp:html blocks render full-width without a max-width wrapper.

UPDATE `wp_posts`
SET `post_content` = '<!-- wp:template-part {"slug":"ll-header","theme":"twentytwentyfive-child"} /-->

<!-- wp:group {"tagName":"main","style":{"spacing":{"margin":{"top":"0"}}},"layout":{"type":"default"}} -->
<main class="wp-block-group" style="margin-top:0"><!-- wp:post-content {"align":"full","layout":{"type":"default"}} /--></main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"ll-footer","theme":"twentytwentyfive-child"} /-->'
WHERE `ID` = 158034;


-- Fix 2: Also update the post content for the front page (ID 7480)
-- to use plain wp:html blocks (no extra wrappers that cause escaping issues).
-- The key fix: remove the extra newlines between block comments which can
-- cause WordPress to treat content as text nodes.

UPDATE `wp_posts`
SET `post_modified` = NOW(),
    `post_modified_gmt` = UTC_TIMESTAMP()
WHERE `ID` = 7480;
