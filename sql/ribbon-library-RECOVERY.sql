-- Recovery + retag: reconstructs the 5 category headers and 8 "available"
-- ribbon cards that got destroyed by a REGEXP_REPLACE backreference bug in
-- ribbon-library-buttons-to-divs.sql (their real content was replaced with
-- literal "1"/"2" placeholders). Real titles and product URLs recovered from
-- WordPress revision 158594 (2026-06-25), the most recent one available.
--
-- Reconstructed as <div> (not <button>) with role="button" tabindex="0" so
-- they stay keyboard-accessible despite not being real buttons anymore.
--
-- Uses plain literal REPLACE() only — no regex, no backreferences — each
-- match anchored by its unique surrounding ll-cat-* wrapper class, so there's
-- no ambiguity between categories with the same card count.

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<div class="ll-cat ll-cat-body">
    <div class="ll-cat-header"1>2</div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card is-soon">',
  '<div class="ll-cat ll-cat-body">
    <div class="ll-cat-header" role="button" tabindex="0" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Healthy Body</span><span class="ll-acc-chevron">&#8250;</span>
    </div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-aging-gracefully/"><span class="ll-ribbon-name">Aging Gracefully</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-losing-weight/"><span class="ll-ribbon-name">Losing Weight</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card is-soon">'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<div class="ll-cat ll-cat-emotion">
    <div class="ll-cat-header"1>2</div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card is-soon">',
  '<div class="ll-cat ll-cat-emotion">
    <div class="ll-cat-header" role="button" tabindex="0" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Healthy Emotions</span><span class="ll-acc-chevron">&#8250;</span>
    </div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-courage-and-confidence/"><span class="ll-ribbon-name">Courage &amp; Confidence</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-coping-with-big-events/"><span class="ll-ribbon-name">Coping with Big Events</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-gratitude/"><span class="ll-ribbon-name">Gratitude</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card is-soon">'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<div class="ll-cat ll-cat-meaning">
    <div class="ll-cat-header"1>2</div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card is-soon">',
  '<div class="ll-cat ll-cat-meaning">
    <div class="ll-cat-header" role="button" tabindex="0" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Finding Meaning</span><span class="ll-acc-chevron">&#8250;</span>
    </div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-finding-your-calling/"><span class="ll-ribbon-name">Finding your Calling</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-to-creativity/"><span class="ll-ribbon-name">Creativity</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card is-soon">'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<div class="ll-cat ll-cat-productive">
    <div class="ll-cat-header"1>2</div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card"1>2</div>
      <div class="ll-ribbon-card is-soon">',
  '<div class="ll-cat ll-cat-productive">
    <div class="ll-cat-header" role="button" tabindex="0" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Productive Life</span><span class="ll-acc-chevron">&#8250;</span>
    </div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card" role="button" tabindex="0" data-product-url="https://www.lullberry.com/product/21-days-digital-detox/"><span class="ll-ribbon-name">Digital Detox</span><span class="ll-ribbon-meta">21 days · available</span></div>
      <div class="ll-ribbon-card is-soon">'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '<div class="ll-cat ll-cat-relations">
    <div class="ll-cat-header"1>2</div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card is-soon">',
  '<div class="ll-cat ll-cat-relations">
    <div class="ll-cat-header" role="button" tabindex="0" aria-expanded="false">
      <span class="ll-cat-dot"></span><span class="ll-cat-title">Relationships</span><span class="ll-acc-chevron">&#8250;</span>
    </div>
    <div class="ll-acc-panel">
      <div class="ll-ribbon-card is-soon">'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
