<?php
/**
 * WP-CLI eval-file script
 * Adds "Apparel 'Wear Your Strength'" as last child under the "Shop" nav item.
 * Run from the site root:
 *   wp eval-file ~/Documents/Lullberry/app/sql/add-wear-your-strength-menu.php
 */

$navs = get_posts([
    'post_type'      => 'wp_navigation',
    'posts_per_page' => -1,
    'post_status'    => 'publish',
]);

if ( empty( $navs ) ) {
    WP_CLI::error( 'No wp_navigation posts found.' );
}

foreach ( $navs as $nav ) {
    WP_CLI::log( "Nav #{$nav->ID}: {$nav->post_title}" );
}

$nav     = $navs[0];
$content = $nav->post_content;

// Guard: don't add twice.
if ( strpos( $content, 'wear-your-strength-children' ) !== false ) {
    WP_CLI::warning( "Item already exists. Nothing changed." );
    exit;
}

$child_block = "\n" . "<!-- wp:navigation-link {\"label\":\"Apparel 'Wear Your Strength' - kids\",\"url\":\"http://lullberry.local/wear-your-strength-children/\",\"kind\":\"custom\",\"isTopLevelLink\":false} /-->";

// Match the Shop navigation-link block (has inner content = submenu).
$pattern = '/(<!-- wp:navigation-link[^>]*?"label"\s*:\s*"Shop".*?-->)(.*?)(<!-- \/wp:navigation-link -->)/s';

if ( preg_match( $pattern, $content ) ) {
    $new_content = preg_replace_callback(
        $pattern,
        function( $m ) use ( $child_block ) {
            return $m[1] . $m[2] . $child_block . "\n" . $m[3];
        },
        $content
    );

    wp_update_post([
        'ID'           => $nav->ID,
        'post_content' => $new_content,
    ]);

    WP_CLI::success( "Added child item under Shop in nav #{$nav->ID}." );
} else {
    WP_CLI::warning( "Shop nav item not found or has no submenu. Raw content:" );
    WP_CLI::log( $content );
}
