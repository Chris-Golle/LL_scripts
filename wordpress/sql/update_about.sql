-- Lullberry About Us — v4
-- Changes from live: lb-about-inspiration -> lb-s3, lead para moved inside hero
-- Last section kept AS IS
-- Run: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/update_about.sql

SET @content = '<!-- wp:group {"align":"full","className":"lb-about-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-about-hero"><!-- wp:paragraph {"className":"lb-eyebrow"} -->
<p class="lb-eyebrow">About Lullberry</p>
<!-- /wp:paragraph -->

<!-- wp:media-text {"mediaPosition":"right","mediaId":154412,"mediaLink":"http://www.lullberry.com/about-us/img_20200822_165404-square/","mediaType":"image","mediaWidth":28,"verticalAlignment":"center"} -->
<div class="wp-block-media-text has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center" style="grid-template-columns:auto 28%"><div class="wp-block-media-text__content"><!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading">Personal growth should be fun and alive</h1>
<!-- /wp:heading --></div><figure class="wp-block-media-text__media"><img src="http://www.lullberry.com/wp-content/uploads/IMG_20200822_165404-square-scaled-1024x1020.jpg" alt="Christophe Golle, founder of Lullberry" class="wp-image-154412 size-full"/></figure></div>
<!-- /wp:media-text -->

<!-- wp:paragraph {"className":"lb-about-lead"} -->
<p class="lb-about-lead">I am an engineer in love with psychology who explored life in community in many countries and ecovillages. Whether in Kathmandu or Tallinn, I keep a daily practice of yoga and meditation. And for that, one day I decided to build the habit tracker that was missing.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"lb-about-origin","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-about-origin"><!-- wp:columns {"verticalAlignment":"center"} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column {"verticalAlignment":"center","width":"55%"} -->
<div class="wp-block-column is-vertically-aligned-center" style="flex-basis:55%"><!-- wp:paragraph {"className":"lb-eyebrow"} -->
<p class="lb-eyebrow">How it began</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">I wanted volume. Texture. Something real.</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The books and methods I tried left me unexcited. Apps on my phone, notebooks in my hands, they all felt flat.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>So I sat down to create a simple, playful design that invites touch.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"center","width":"45%"} -->
<div class="wp-block-column is-vertically-aligned-center" style="flex-basis:45%"><!-- wp:quote {"className":"lb-about-pull"} -->
<blockquote class="wp-block-quote lb-about-pull"><!-- wp:paragraph -->
<p>My mission is to design playful ways to everyone&#8217;s best self</p>
<!-- /wp:paragraph --></blockquote>
<!-- /wp:quote --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"lb-s3","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-s3"><!-- wp:paragraph {"className":"lb-eyebrow"} -->
<p class="lb-eyebrow">The company&#8217;s guiding voice</p>
<!-- /wp:paragraph -->

<!-- wp:media-text {"mediaPosition":"right","mediaId":157816,"mediaLink":"http://lullberry.local/buddha/","mediaType":"image","mediaWidth":28,"verticalAlignment":"center"} -->
<div class="wp-block-media-text has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center" style="grid-template-columns:auto 28%"><div class="wp-block-media-text__content"><!-- wp:paragraph -->
<p>Smile, breathe and go slowly</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Thich Nhat Hanh</em></p>
<!-- /wp:paragraph --></div><figure class="wp-block-media-text__media"><img src="http://lullberry.local/wp-content/uploads/buddha.jpg" alt="" class="wp-image-157816 size-full"/></figure></div>
<!-- /wp:media-text --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"lb-about-team","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull lb-about-team"><!-- wp:paragraph {"className":"lb-eyebrow"} -->
<p class="lb-eyebrow">Join in!</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A tiny, human company</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Below are snapshots of life: Christophe with a friend and a unicorn, the cowork support team, the cowork.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you want to bring your passion for design, psychology or marketing to the project, <a href="/contact">I&#8217;d love to hear from you</a>!</p>
<!-- /wp:paragraph -->

<!-- wp:gallery {"linkTo":"none"} -->
<figure class="wp-block-gallery has-nested-images columns-default is-cropped"><!-- wp:image {"id":154344,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="http://www.lullberry.com/wp-content/uploads/promo1-1024x987.jpg" alt="" class="wp-image-154344"/></figure>
<!-- /wp:image -->

<!-- wp:image {"id":154345,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="http://www.lullberry.com/wp-content/uploads/promo2-1024x668.jpg" alt="" class="wp-image-154345"/></figure>
<!-- /wp:image -->

<!-- wp:image {"id":154346,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="http://www.lullberry.com/wp-content/uploads/promo3-768x1024.jpg" alt="" class="wp-image-154346"/></figure>
<!-- /wp:image --></figure>
<!-- /wp:gallery --></div>
<!-- /wp:group -->';

UPDATE wp_posts
SET post_content  = @content,
    post_status   = 'publish',
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE post_name = 'about-us'
  AND post_type = 'page';
