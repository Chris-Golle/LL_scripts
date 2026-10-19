-- Lullberry: Planet page + Footer template part
-- Planet page: post ID 26580
-- Footer template part: post ID 157998

-- =============================================
-- PLANET PAGE
-- =============================================

SET @planet = '<!-- wp:group {"align":"full","className":"ll-s1","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s1"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Our commitment</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading">Made to last, not to be replaced</h1>
<!-- /wp:heading -->

<!-- wp:paragraph {"className":"ll-about-lead"} -->
<p class="ll-about-lead">Lullberry is a physical object you keep for years. That is, by itself, an environmental statement. We made every material choice with that in mind.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s-light","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s-light"><!-- wp:columns {"verticalAlignment":"center"} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Materials</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Baltic birch. Nothing else.</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The tracker is made from Baltic birch, one of the most stable and durable hardwoods available. No veneers, no composites, no plastic parts. The ribbons are woven from satin, a long-lasting fabric that can be rolled and unrolled thousands of times without wear.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We source locally where possible and keep the manufacturing footprint small by design.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column -->
<div class="wp-block-column"><!-- wp:quote {"className":"ll-about-pull"} -->
<blockquote class="wp-block-quote ll-about-pull"><!-- wp:paragraph -->
<p>A well-made object that outlasts a trend is the most sustainable product there is.</p>
<!-- /wp:paragraph --></blockquote>
<!-- /wp:quote --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s-dark","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s-dark"><!-- wp:columns {"verticalAlignment":"center"} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Packaging</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">No waste by design</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The tracker ships in minimal, fully recyclable packaging. No styrofoam, no single-use plastic, no unnecessary inserts. Just the object, protected simply and honestly.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Giving back</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">A share of every sale goes to nature</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>We are still deciding on the exact partner and structure. What is certain: a meaningful share of every sale will support environmental causes. We will publish the details before launch.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s6","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s6" id="ll-notify"><!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">Be the first to know when Lullberry launches.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[mailerlite_form form_id=1]
<!-- /wp:shortcode --></div>
<!-- /wp:group -->';

UPDATE wp_posts
SET post_content  = @planet,
    post_status   = 'publish',
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 26580;

-- =============================================
-- FOOTER TEMPLATE PART
-- =============================================

SET @footer = '<!-- wp:group {"align":"full","className":"ll-footer","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-footer"><!-- wp:columns {"verticalAlignment":"top"} -->
<div class="wp-block-columns are-vertically-aligned-top"><!-- wp:column {"width":"40%"} -->
<div class="wp-block-column" style="flex-basis:40%"><!-- wp:site-logo {"width":120} /-->

<!-- wp:paragraph {"className":"ll-footer-tagline"} -->
<p class="ll-footer-tagline">A handcrafted habit trainer.<br>No app. No streaks. Just you.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"width":"30%"} -->
<div class="wp-block-column" style="flex-basis:30%"><!-- wp:paragraph {"className":"ll-footer-heading"} -->
<p class="ll-footer-heading">Explore</p>
<!-- /wp:paragraph -->

<!-- wp:list {"className":"ll-footer-links"} -->
<ul class="wp-block-list ll-footer-links"><!-- wp:list-item -->
<li><a href="/product/habit-tracker-21-days/">Habit trainer</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="/#ll-ribbons">Ribbons</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="/about-us/">About</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="/contact/">Contact</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="/we-care-for-the-planet/">We care for the planet</a></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></div>
<!-- /wp:column -->

<!-- wp:column {"width":"30%"} -->
<div class="wp-block-column" style="flex-basis:30%"><!-- wp:paragraph {"className":"ll-footer-heading"} -->
<p class="ll-footer-heading">Stay in touch</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"className":"ll-footer-sub"} -->
<p class="ll-footer-sub">Be the first to know when Lullberry launches.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[mailerlite_form form_id=1]
<!-- /wp:shortcode --></div>
<!-- /wp:column --></div>
<!-- /wp:columns -->

<!-- wp:separator {"className":"ll-footer-rule"} -->
<hr class="wp-block-separator ll-footer-rule"/>
<!-- /wp:separator -->

<!-- wp:columns -->
<div class="wp-block-columns"><!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-footer-copy"} -->
<p class="ll-footer-copy">© 2025 Lullberry. All rights reserved.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"textAlign":"right"} -->
<div class="wp-block-column"><!-- wp:paragraph {"align":"right","className":"ll-footer-copy"} -->
<p class="has-text-align-right ll-footer-copy"><a href="/privacy-policy/">Privacy policy</a></p>
<!-- /wp:paragraph --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->';

UPDATE wp_posts
SET post_content  = @footer,
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 157998;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
