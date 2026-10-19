UPDATE wp_posts
SET
    post_content      = REPLACE(
        post_content,
        '<!-- wp:term-description {"align":"wide"} /-->',
        '<!-- wp:shortcode -->[ll_strength_description]<!-- /wp:shortcode -->'
    ),
    post_modified     = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 158583;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
