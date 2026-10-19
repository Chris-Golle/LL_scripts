<?php
/**
 * WP-CLI eval-file script
 * Adds a "Help" nav item with Terms and Privacy as children.
 * Run from the site root:
 *   wp eval-file ~/Documents/Lullberry/app/sql/add-help-menu.php
 */

$navs = get_posts([
    'post_type'      => 'wp_navigation',
    'posts_per_page' => -1,
    'post_status'    => 'publish',
]);

if ( empty( $navs ) ) {
    WP_CLI::error( 'No wp_navigation posts found.' );
}

$nav     = $navs[0];
$content = $nav->post_content;

// Guard: don't add twice.
if ( strpos( $content, '"Help"' ) !== false ) {
    WP_CLI::warning( "Help item already exists. Nothing changed." );
    exit;
}

$help_block = <<<'BLOCK'

<!-- wp:navigation-submenu {"label":"Help","url":"","kind":"custom","isTopLevelLink":true} -->
<!-- wp:navigation-link {"label":"Terms of Use","url":"http://lullberry.local/terms-of-use/","kind":"custom","isTopLevelLink":false} /-->
<!-- wp:navigation-link {"label":"Privacy","url":"http://lullberry.local/privacy-policy/","kind":"custom","isTopLevelLink":false} /-->
<!-- /wp:navigation-submenu -->
BLOCK;

// Append Help before the closing navigation block tag.
$new_content = preg_replace(
    '/(<!-- \/wp:navigation -->)\s*$/',
    $help_block . "\n$1",
    $content
);

if ( $new_content === $content ) {
    // Fallback: just append at the end if pattern not found.
    $new_content = $content . $help_block;
}

wp_update_post([
    'ID'           => $nav->ID,
    'post_content' => $new_content,
]);

WP_CLI::success( "Added Help > Terms / Privacy to nav #{$nav->ID}." );
