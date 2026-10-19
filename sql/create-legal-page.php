<?php
/**
 * WP-CLI eval-file script
 * 1. Pulls content from existing Terms and Privacy pages
 * 2. Creates a merged /legal page with two sections
 * 3. Updates the Help nav item to point to /legal (no submenu)
 *
 * Run from the site root:
 *   wp eval-file ~/Documents/Lullberry/app/sql/create-legal-page.php
 */

// ── 1. Find source pages ─────────────────────────────────────────────────────

$terms   = get_page_by_path( 'terms-of-use' );
$privacy = get_page_by_path( 'privacy-policy' );

if ( ! $terms )   WP_CLI::error( 'Could not find page at /terms-of-use/' );
if ( ! $privacy ) WP_CLI::error( 'Could not find page at /privacy-policy/' );

WP_CLI::log( "Terms page #{$terms->ID}: {$terms->post_title}" );
WP_CLI::log( "Privacy page #{$privacy->ID}: {$privacy->post_title}" );

// ── 2. Build merged content ──────────────────────────────────────────────────

$terms_content   = $terms->post_content;
$privacy_content = $privacy->post_content;

$merged = <<<CONTENT
<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Terms of Use</h2>
<!-- /wp:heading -->

{$terms_content}

<!-- wp:separator {"className":"is-style-wide"} -->
<hr class="wp-block-separator has-alpha-channel-opacity is-style-wide"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Privacy Policy</h2>
<!-- /wp:heading -->

{$privacy_content}
CONTENT;

// ── 3. Create or update /legal ───────────────────────────────────────────────

$existing = get_page_by_path( 'legal' );

if ( $existing ) {
    wp_update_post([
        'ID'           => $existing->ID,
        'post_content' => $merged,
    ]);
    $legal_id = $existing->ID;
    WP_CLI::log( "Updated existing /legal page (#{$legal_id})." );
} else {
    $legal_id = wp_insert_post([
        'post_title'   => 'Legal',
        'post_name'    => 'legal',
        'post_content' => $merged,
        'post_status'  => 'publish',
        'post_type'    => 'page',
    ]);
    WP_CLI::log( "Created /legal page (#{$legal_id})." );
}

// ── 4. Update Help nav item to single link ───────────────────────────────────

$navs = get_posts([
    'post_type'      => 'wp_navigation',
    'posts_per_page' => -1,
    'post_status'    => 'publish',
]);

if ( empty( $navs ) ) {
    WP_CLI::warning( 'No navigation found — skipping menu update.' );
    exit;
}

$nav     = $navs[0];
$content = $nav->post_content;

// Replace any existing Help submenu or link with a clean single link.
$content = preg_replace(
    '/<!-- wp:navigation-submenu[^>]*?"label"\s*:\s*"Help".*?<!-- \/wp:navigation-submenu -->/s',
    '',
    $content
);
$content = preg_replace(
    '/<!-- wp:navigation-link[^>]*?"label"\s*:\s*"Help".*?\/-->/s',
    '',
    $content
);

$help_link = "\n" . '<!-- wp:navigation-link {"label":"Help","url":"http://lullberry.local/legal/","kind":"custom","isTopLevelLink":true} /-->';

// Append before closing navigation tag, or at end.
if ( strpos( $content, '<!-- /wp:navigation -->' ) !== false ) {
    $content = preg_replace( '/(<!-- \/wp:navigation -->)\s*$/', $help_link . "\n$1", $content );
} else {
    $content .= $help_link;
}

wp_update_post([
    'ID'           => $nav->ID,
    'post_content' => $content,
]);

WP_CLI::success( "Nav updated: Help → /legal/" );
