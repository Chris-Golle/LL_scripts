-- Update /wear-your-strength/ with standard ll-section / ll-lead classes.

UPDATE wp_posts SET post_content = '<!-- wp:group {"align":"full","className":"ll-section ll-section--light ll-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light ll-hero"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Wear your strength</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":1,"textAlign":"center"} -->
<h1 class="wp-block-heading has-text-align-center">Look at you!</h1>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center","className":"ll-about-lead ll-lead"} -->
<p class="has-text-align-center ll-about-lead ll-lead">A line of clothes to wear your strengths — with an inspiring secret message inside.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"align":"center","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image aligncenter size-large ll-media-frame"><img src="http://lullberry.local/wp-content/uploads/Lullberry-couple-humi-crea-e1653025486449.png" alt="Lullberry couple"/></figure>
<!-- /wp:image --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--light ll-quiz-trigger-section","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light ll-quiz-trigger-section"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Discover yourself</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2,"textAlign":"center"} -->
<h2 class="wp-block-heading has-text-align-center">Which of the 20 character strengths are yours?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">Find out in 4 playful questions.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[personality_quiz]
<!-- /wp:shortcode --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--dark quiz-taken quiz-results","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--dark quiz-taken quiz-results"><!-- wp:paragraph {"className":"ll-eyebrow","align":"center"} -->
<p class="has-text-align-center ll-eyebrow">Your results</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2,"textAlign":"center"} -->
<h2 class="wp-block-heading has-text-align-center">Your character strengths</h2>
<!-- /wp:heading -->

<!-- wp:html -->
<div id="quiz-results" style="text-align:center;margin-top:2rem;"></div>
<!-- /wp:html -->

<!-- wp:html -->
<div class="box" id="remember"><span>Remember that you are </span><span class="typewriter"></span></div>
<!-- /wp:html -->

<!-- wp:buttons {"className":"quiz-taken","layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons quiz-taken"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button" href="http://lullberry.local/wear-your-strength/?all">View all strengths</a></div>
<!-- /wp:button -->

<!-- wp:button {"className":"start-quiz"} -->
<div class="wp-block-button start-quiz"><a class="wp-block-button__link wp-element-button">Retake the quiz</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--light","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light"><!-- wp:heading {"level":3,"textAlign":"center"} -->
<h3 class="wp-block-heading has-text-align-center">Not sure which strengths to wear?</h3>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">Your top strengths are a great way to start. There is also joy to find in developing your middle strengths, or even your lesser ones. Take the long-version test at <a href="https://www.viacharacter.org" target="_blank" rel="noreferrer noopener">VIA Institute on Character</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3,"textAlign":"center"} -->
<h3 class="wp-block-heading has-text-align-center">Who created the calligraphies?</h3>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">They are inspired by the art of Buddhist monk Thich Nhat Hanh of Plum Village, with authorization. I honor his memory with a line of beautiful apparel that is also vitamins for the soul: research shows that growing your strengths will make you happier, healthier, feeling more confident and competent.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->'
WHERE post_name = 'wear-your-strength' AND post_type = 'page';

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
