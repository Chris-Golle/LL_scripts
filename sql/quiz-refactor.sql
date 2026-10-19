UPDATE wp_posts
SET post_content = '<!-- wp:group {"anchor":"quiz-modal","className":"ll-quiz-modal"} -->
<div id="quiz-modal" class="wp-block-group ll-quiz-modal">

<!-- wp:group {"anchor":"quiz-active"} -->
<div id="quiz-active" class="wp-block-group">

<!-- wp:heading {"className":"quiz-qst"} -->
<h2 class="wp-block-heading quiz-qst"></h2>
<!-- /wp:heading -->

<!-- wp:buttons {"layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons">
<!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button"></a></div>
<!-- /wp:button -->

<!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button"></a></div>
<!-- /wp:button -->
</div>
<!-- /wp:buttons -->

</div>
<!-- /wp:group -->

<!-- wp:group {"anchor":"quiz-complete"} -->
<div id="quiz-complete" class="wp-block-group">

<!-- wp:heading -->
<h2 class="wp-block-heading">Reading your strengths in the stars</h2>
<!-- /wp:heading -->

<!-- wp:html -->
<div id="quiz-stars"></div>
<!-- /wp:html -->

<!-- wp:paragraph {"style":{"typography":{"textAlign":"center"}}} -->
<p class="has-text-align-center">stars counted</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"className":"quiz-ready","style":{"typography":{"textAlign":"center"}}} -->
<p class="has-text-align-center quiz-ready">Your results are ready!</p>
<!-- /wp:paragraph -->

<!-- wp:buttons {"layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons">
<!-- wp:button {"className":"quiz-ready"} -->
<div class="wp-block-button quiz-ready"><a class="wp-block-button__link wp-element-button">View my strengths</a></div>
<!-- /wp:button -->
</div>
<!-- /wp:buttons -->

</div>
<!-- /wp:group -->

</div>
<!-- /wp:group -->'
WHERE post_name = 'quiz' AND post_status = 'publish';

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
