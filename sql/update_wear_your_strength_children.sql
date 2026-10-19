-- Update /wear-your-strength-children/ — all classes migrated to ll- prefix, planet removed

UPDATE wp_posts SET post_content = '<!-- wp:group {"align":"full","className":"ll-s1","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s1"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Wear your strength</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":1,"textAlign":"center"} -->
<h1 class="wp-block-heading has-text-align-center">Look at you!</h1>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center","className":"ll-about-lead"} -->
<p class="has-text-align-center ll-about-lead">A line of clothes for children to wear their strengths — with an inspiring affirmation inside.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":154401,"align":"center","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image aligncenter size-large"><img src="http://www.lullberry.com/wp-content/uploads/team-1024x683.jpg" alt="Lullberry children" class="wp-image-154401"/></figure>
<!-- /wp:image --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s-light ll-quiz-trigger-section","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s-light ll-quiz-trigger-section"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Discover yourself</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2,"textAlign":"center"} -->
<h2 class="wp-block-heading has-text-align-center">Which of the 8 character strengths are yours?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">Find out in 4 playful questions.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[personality_quiz]
<!-- /wp:shortcode --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s-dark quiz-taken quiz-results","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s-dark quiz-taken quiz-results"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Your results</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2,"textAlign":"center"} -->
<h2 class="wp-block-heading has-text-align-center">Your strengths and affirmations</h2>
<!-- /wp:heading -->

<!-- wp:shortcode -->
[product_categories_quiz age="1"]
<!-- /wp:shortcode -->

<!-- wp:html -->
<div class="box" id="remember"><span>Remember how </span><span class="typewriter"></span><p style="text-align:center;">you can be!</p></div>
<!-- /wp:html -->

<!-- wp:buttons {"className":"quiz-taken","layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons quiz-taken"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button" href="http://lullberry.local/wear-your-strength-children/?all">View all strengths</a></div>
<!-- /wp:button -->

<!-- wp:button {"className":"start-quiz"} -->
<div class="wp-block-button start-quiz"><a class="wp-block-button__link wp-element-button">Retake the quiz</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s-light","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s-light"><!-- wp:heading {"level":3,"textAlign":"center"} -->
<h3 class="wp-block-heading has-text-align-center">Did you find your affirmation?</h3>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">Cute t-shirts will soon be ready and you will be able to wear it. You can also take the <a href="https://www.viacharacter.org" target="_blank" rel="noreferrer noopener">official children''s test here</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:media-text {"mediaPosition":"left","mediaId":156093,"mediaLink":"#","mediaType":"image","mediaWidth":50} -->
<div class="wp-block-media-text alignwide is-stacked-on-mobile" style="grid-template-columns:50% auto">
<figure class="wp-block-media-text__media"><img src="http://www.lullberry.com/wp-content/uploads/love-of-learning-1024x683.jpg" alt="Lullberry mom and child" class="wp-image-156093"/></figure>
<div class="wp-block-media-text__content"><!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Remember.</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>These clothes help children remember their strengths. Wear your qualities and they will blossom to reveal the best version of you.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Become your true self.</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>What will your courage look like when it blossoms? Your joy? Your gratitude? Grow new talents or turn existing ones into superpowers!</p>
<!-- /wp:paragraph --></div></div>
<!-- /wp:media-text --></div>
<!-- /wp:group -->'
WHERE post_name = 'wear-your-strength-children' AND post_type = 'page';

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
