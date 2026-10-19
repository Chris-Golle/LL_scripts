-- Lullberry homepage — v10
-- Uses standard ll-section / ll-card classes. Buy CTA inside the dark feature section.
-- Post ID: 7480

-- Resolve tracker URL from post ID
SET @tracker_url = CONCAT('https://www.lullberry.com/product/', (SELECT post_name FROM wp_posts WHERE ID = 157457 LIMIT 1), '/');

SET @content = '<!-- wp:group {"align":"full","className":"ll-section ll-section--dark ll-hero","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--dark ll-hero"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Step by step</p>
<!-- /wp:paragraph -->

<!-- wp:media-text {"mediaPosition":"right","mediaId":157867,"mediaLink":"https://www.lullberry.com/home/img_20231205_111412/","mediaType":"image","imageFill":true,"focalPoint":{"x":0.54000000000000004,"y":0.40999999999999998}} -->
<div class="wp-block-media-text has-media-on-the-right is-stacked-on-mobile is-image-fill-element"><div class="wp-block-media-text__content"><!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading">Build your habits gently</h1>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A handcrafted companion that guides you through 21 days of a new habit, quietly, gently, without an app.</p>
<!-- /wp:paragraph -->

<!-- wp:buttons -->
<div class="wp-block-buttons"><!-- wp:button {"className":"ll-btn-primary"} -->
<div class="wp-block-button ll-btn-primary"><a class="wp-block-button__link wp-element-button" href="#ll-how">How it works</a></div>
<!-- /wp:button -->

<!-- wp:button {"className":"is-style-outline ll-btn-secondary"} -->
<div class="wp-block-button is-style-outline ll-btn-secondary"><a class="wp-block-button__link wp-element-button" href="#ll-ribbons">Choose your next habit</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div><figure class="wp-block-media-text__media"><img src="https://www.lullberry.com/wp-content/uploads/IMG_20231205_111412-1024x768.jpg" alt="" class="wp-image-157867 size-full" style="object-position:54% 41%"/></figure></div>
<!-- /wp:media-text --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--light","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--light" id="ll-how"><!-- wp:paragraph {"align":"center","className":"ll-eyebrow"} -->
<p class="has-text-align-center ll-eyebrow">How it works</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"textAlign":"center"} -->
<h2 class="wp-block-heading has-text-align-center">One habit. Two ribbons. One ritual.</h2>
<!-- /wp:heading -->

<!-- wp:image {"id":158410,"sizeSlug":"full","linkDestination":"none","align":"center"} -->
<figure class="wp-block-image aligncenter size-full"><img src="https://www.lullberry.com/wp-content/uploads/day18-2.gif" alt="" class="wp-image-158410"/></figure>
<!-- /wp:image -->

<!-- wp:columns -->
<div class="wp-block-columns"><!-- wp:column {"className":"ll-step-col ll-step-card ll-card"} -->
<div class="wp-block-column ll-step-col ll-step-card ll-card"><!-- wp:paragraph {"className":"ll-step-num"} -->
<p class="ll-step-num">1</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Choose your habit</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Pick from 40+ topics, health, emotional well-being, creativity, productivity, and relationships.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"className":"ll-step-col ll-step-card ll-card"} -->
<div class="wp-block-column ll-step-col ll-step-card ll-card"><!-- wp:paragraph {"className":"ll-step-num"} -->
<p class="ll-step-num">2</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Slide in your ribbons</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Each set of 2 ribbons brings one daily insight, distilled from the best books, tailored for you as a feeler, a doer or a thinker.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"className":"ll-step-col ll-step-card ll-card"} -->
<div class="wp-block-column ll-step-col ll-step-card ll-card"><!-- wp:paragraph {"className":"ll-step-num"} -->
<p class="ll-step-num">3</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Turn the pendulum</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Miss a day? Simply continue. On day 21, place the flower token in your pocket. Your ritual is becoming a habit.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--dark","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--dark"><!-- wp:columns -->
<div class="wp-block-columns"><!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Habit tracker</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A ritual, not a performance</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>No notifications. No streaks. No data. Just you, a beautiful handcrafted object, and a quiet daily moment.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Turn the pendulum to mark each day done</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Miss a day? Simply continue</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Flower token on day 21</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Handcrafted Baltic birch and satin ribbon</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></div>
<!-- /wp:column -->

<!-- wp:column -->
<div class="wp-block-column"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Habit coach</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learn from the best thinkers</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>21-day roadmaps distilled from leading books. Each day one insight, easy to follow, easy to apply.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Feeler, doer, or thinker, you choose</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Evidence-based, not pop-psychology</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>40+ topics across all areas of life</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>No time for personal development books? I distilled them for you.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></div>
<!-- /wp:column --></div>
<!-- /wp:columns -->

<!-- wp:html -->
<div class="ll-buy-cta-wrap">
  <button class="ll-buy-card product-fullscreen-button" data-product-url="__TRACKER_URL__">
    <span class="ll-buy-card-title">Get your habit tracker</span>
    <span class="ll-buy-card-meta">handcrafted &middot; Baltic birch</span>
  </button>
</div>
<!-- /wp:html --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--white","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--white" id="ll-ribbons"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">The ribbon library</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What will you grow?</h2>
<!-- /wp:heading -->

<!-- wp:html -->
<div class="ll-ribbon-tabs">
  <button class="ll-tab active" data-cat="ll-cat-body">Healthy Body</button>
  <button class="ll-tab" data-cat="ll-cat-emotion">Healthy Emotions</button>
  <button class="ll-tab" data-cat="ll-cat-meaning">Finding Meaning</button>
  <button class="ll-tab" data-cat="ll-cat-productive">Productive Life</button>
  <button class="ll-tab" data-cat="ll-cat-relations">Relationships</button>
  <button class="ll-tab" data-cat="all">All roadmaps</button>
</div>

<div class="ll-ribbon-library">
  <div class="ll-cat ll-cat-body">
    <button class="ll-cat-header" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Healthy Body</span><span class="ll-acc-chevron">&#8250;</span>
    </button>
    <div class="ll-acc-panel">
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-aging-gracefully/"><span class="ll-ribbon-name">Aging Gracefully</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-losing-weight/"><span class="ll-ribbon-name">Losing Weight</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Eat Mindfully</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Healthy Eating</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Fitness &amp; Movement</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Sleep</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Relaxation</span><span class="ll-ribbon-meta">coming soon</span></div>
    </div>
  </div>
  <div class="ll-cat ll-cat-emotion">
    <button class="ll-cat-header" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Healthy Emotions</span><span class="ll-acc-chevron">&#8250;</span>
    </button>
    <div class="ll-acc-panel">
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-courage-and-confidence/"><span class="ll-ribbon-name">Courage &amp; Confidence</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-coping-with-big-events/"><span class="ll-ribbon-name">Coping with Big Events</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-gratitude/"><span class="ll-ribbon-name">Gratitude</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">At Peace with Death</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Emotional Balance</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Mindfulness</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Joy &amp; Play</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Positive Psychology</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Self-Love</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Forgiveness</span><span class="ll-ribbon-meta">coming soon</span></div>
    </div>
  </div>
  <div class="ll-cat ll-cat-meaning">
    <button class="ll-cat-header" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Finding Meaning</span><span class="ll-acc-chevron">&#8250;</span>
    </button>
    <div class="ll-acc-panel">
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-finding-your-calling/"><span class="ll-ribbon-name">Finding your Calling</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-to-creativity/"><span class="ll-ribbon-name">Creativity</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Journaling</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Reading Books</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Spiritual Path</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Lifelong Learning</span><span class="ll-ribbon-meta">coming soon</span></div>
    </div>
  </div>
  <div class="ll-cat ll-cat-productive">
    <button class="ll-cat-header" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Productive Life</span><span class="ll-acc-chevron">&#8250;</span>
    </button>
    <div class="ll-acc-panel">
      <button class="ll-ribbon-card product-fullscreen-button" data-product-url="https://www.lullberry.com/product/21-days-digital-detox/"><span class="ll-ribbon-name">Digital Detox</span><span class="ll-ribbon-meta">21 days · available</span></button>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Breaking a Bad Habit</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Eco-Friendly Living</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Morning Rituals</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Focus</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Productivity &amp; Time</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Declutter &amp; Simplify</span><span class="ll-ribbon-meta">coming soon</span></div>
    </div>
  </div>
  <div class="ll-cat ll-cat-relations">
    <button class="ll-cat-header" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Relationships</span><span class="ll-acc-chevron">&#8250;</span>
    </button>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Finding Love</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Kindness</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Motherhood</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Nurturing Love</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Parenting</span><span class="ll-ribbon-meta">coming soon</span></div>
      <div class="ll-ribbon-soon"><span class="ll-ribbon-name">Connection &amp; Friendships</span><span class="ll-ribbon-meta">coming soon</span></div>
    </div>
  </div>
</div>

<script>
(function () {
  function setMode(cat) {
    var isAll = cat === \'all\';
    document.querySelectorAll(\'.ll-cat\').forEach(function (el) {
      el.style.display = (isAll || el.classList.contains(cat)) ? \'\' : \'none\';
    });
    document.querySelectorAll(\'.ll-acc-chevron\').forEach(function (ch) {
      ch.style.display = isAll ? \'\' : \'none\';
    });
    if (!isAll) {
      var trigger = document.querySelector(\'.\' + cat + \' .ll-cat-header\');
      var panel = trigger && trigger.nextElementSibling;
      if (trigger) {
        trigger.setAttribute(\'aria-expanded\', \'true\');
        panel.classList.add(\'ll-acc-open\');
      }
    }
  }

  document.querySelectorAll(\'.ll-cat-header\').forEach(function (btn) {
    btn.addEventListener(\'click\', function () {
      var activeTab = document.querySelector(\'.ll-tab.active\');
      if (!activeTab || activeTab.dataset.cat !== \'all\') return;
      var panel = this.nextElementSibling;
      var open = this.getAttribute(\'aria-expanded\') === \'true\';
      this.setAttribute(\'aria-expanded\', !open);
      panel.classList.toggle(\'ll-acc-open\', !open);
    });
  });

  document.querySelectorAll(\'.ll-tab\').forEach(function (tab) {
    tab.addEventListener(\'click\', function () {
      document.querySelectorAll(\'.ll-tab\').forEach(function (t) { t.classList.remove(\'active\'); });
      this.classList.add(\'active\');
      setMode(this.dataset.cat);
    });
  });

  var firstTab = document.querySelector(\'.ll-tab.active\');
  if (firstTab) setMode(firstTab.dataset.cat);
})();
</script>
<!-- /wp:html -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center"><em>40+ ribbons planned · new ones regularly added</em></p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-s5","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-s5"><!-- wp:columns {"verticalAlignment":"center"} -->
<div class="wp-block-columns are-vertically-aligned-center"><!-- wp:column {"verticalAlignment":"center"} -->
<div class="wp-block-column is-vertically-aligned-center"><!-- wp:paragraph {"className":"ll-eyebrow"} -->
<p class="ll-eyebrow">Why not an app?</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Made to be rolled, not scrolled</h2>
<!-- /wp:heading -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><!-- wp:paragraph -->
<p>Turning the pendulum is an anchor for your habit.</p>
<!-- /wp:paragraph --></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p>This physical companion lives in your space. You touch it every morning. It catches your eye, reminds you gently, without pinging you. No data, no subscription.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:column -->

<!-- wp:column {"verticalAlignment":"center"} -->
<div class="wp-block-column is-vertically-aligned-center"><!-- wp:image {"id":158413,"sizeSlug":"full","linkDestination":"none","align":"center"} -->
<figure class="wp-block-image aligncenter size-full"><img src="https://www.lullberry.com/wp-content/uploads/day21.gif" alt="" class="wp-image-158413"/></figure>
<!-- /wp:image --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->

<!-- wp:group {"align":"full","className":"ll-section ll-section--birch","layout":{"type":"constrained"}} -->
<div class="wp-block-group alignfull ll-section ll-section--birch" id="ll-notify"><!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center">The habit tracker and ribbons are still in the making.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[mailerlite_form form_id=1]
<!-- /wp:shortcode --></div>
<!-- /wp:group -->';

-- Inject the tracker URL resolved from post ID
SET @content = REPLACE(@content, '__TRACKER_URL__', @tracker_url);

UPDATE wp_posts
SET post_content = @content,
    post_status  = 'publish',
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
