-- Retag .ll-cat-header and .ll-ribbon-card from <button> to <div>.
-- They keep their click handlers (already attached via addEventListener in
-- the inline <script>, which works the same on any element) and their own
-- cursor:pointer — they just stop matching the button, .wp-element-button,
-- .wp-block-button__link selector list in style.css, so the wood-plaque
-- background/border/box-shadow/color/text-shadow overrides no longer apply
-- (and the inherited engrave text-shadow on their child spans disappears).
--
-- Note: <div> isn't natively keyboard-accessible like <button> was. If you
-- want Enter/Space to still work, add role="button" tabindex="0" plus a
-- keydown handler in the inline script — not done here since it wasn't asked for.

UPDATE wp_posts
SET post_content = REGEXP_REPLACE(
  post_content,
  '<button class="ll-cat-header"([^>]*)>(.*?)</button>',
  '<div class="ll-cat-header"\\1>\\2</div>',
  1, 0, 'n'
)
WHERE ID = 7480;

UPDATE wp_posts
SET post_content = REGEXP_REPLACE(
  post_content,
  '<button class="ll-ribbon-card"([^>]*)>(.*?)</button>',
  '<div class="ll-ribbon-card"\\1>\\2</div>',
  1, 0, 'n'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
