-- Lullberry copy fixes, 2026-07-06
-- Run with: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/copy-fixes-2026-07-06.sql

-- 1) Add descriptions to the 8 empty "21 Days to X" ribbon products
UPDATE wp_posts SET
  post_content = '<p>Getting older is not a problem to solve. It is a chapter to write well.</p><p>21 days, one insight a day, distilled from the best books on aging with grace. Slide the ribbon into your habit tracker and let it walk you through acceptance, vitality and quiet confidence.</p><p>Miss a day? Simply pick up where you left off. By day 21, you will carry a steadier relationship with time.</p>',
  post_excerpt = '21 days, one insight a day, distilled from the best books on aging with grace. Slides right into your habit tracker.'
WHERE ID = 158091;

UPDATE wp_posts SET
  post_content = '<p>Confidence is not the absence of fear. It is showing up anyway.</p><p>21 days, one insight a day, drawn from the best books on courage and self-belief. Slide the ribbon into your habit tracker and take one small brave step every day.</p><p>Miss a day? Simply continue. By day 21, showing up will feel a little more natural.</p>',
  post_excerpt = '21 days, one insight a day, drawn from the best books on courage and self-belief. Slides right into your habit tracker.'
WHERE ID = 158094;

UPDATE wp_posts SET
  post_content = '<p>Your attention is the most valuable thing you own. This roadmap helps you take it back.</p><p>21 days, one insight a day, distilled from the best books on digital wellbeing. Slide the ribbon into your habit tracker and build a lighter relationship with your screens.</p><p>Miss a day? Simply continue. By day 21, quiet moments will feel less like something you are missing out on.</p>',
  post_excerpt = '21 days, one insight a day, distilled from the best books on digital wellbeing. Slides right into your habit tracker.'
WHERE ID = 158097;

UPDATE wp_posts SET
  post_content = '<p>Gratitude is a habit before it is a feeling.</p><p>21 days, one insight a day, drawn from the best books on gratitude and appreciation. Slide the ribbon into your habit tracker and notice a little more each day.</p><p>Miss a day? Simply pick up where you left off. By day 21, noticing the good will start to come naturally.</p>',
  post_excerpt = '21 days, one insight a day, drawn from the best books on gratitude and appreciation. Slides right into your habit tracker.'
WHERE ID = 158100;

UPDATE wp_posts SET
  post_content = '<p>A calling rarely arrives all at once. It is found one clue at a time.</p><p>21 days, one insight a day, distilled from the best books on purpose and vocation. Slide the ribbon into your habit tracker and follow the thread, one small reflection at a time.</p><p>Miss a day? Simply continue. By day 21, your own clues will feel a little clearer.</p>',
  post_excerpt = '21 days, one insight a day, distilled from the best books on purpose and vocation. Slides right into your habit tracker.'
WHERE ID = 158126;

UPDATE wp_posts SET
  post_content = '<p>Big changes ask a lot of us. This roadmap asks for just one small step a day.</p><p>21 days, one insight a day, drawn from the best books on resilience and change. Slide the ribbon into your habit tracker and move through the moment with a little more steadiness.</p><p>Miss a day? Simply pick up where you left off. There is no wrong pace here.</p>',
  post_excerpt = '21 days, one insight a day, drawn from the best books on resilience and change. Slides right into your habit tracker.'
WHERE ID = 158130;

UPDATE wp_posts SET
  post_content = '<p>Creativity is less about inspiration and more about showing up with an open hand.</p><p>21 days, one insight a day, distilled from the best books on creative thinking. Slide the ribbon into your habit tracker and give your ideas a small daily nudge.</p><p>Miss a day? Simply continue. By day 21, curiosity will be doing more of the work.</p>',
  post_excerpt = '21 days, one insight a day, distilled from the best books on creative thinking. Slides right into your habit tracker.'
WHERE ID = 158133;

UPDATE wp_posts SET
  post_content = '<p>Lasting change comes from small, kind decisions, repeated.</p><p>21 days, one insight a day, drawn from the best books on healthy habits and self-compassion. Slide the ribbon into your habit tracker and build momentum gently, one day at a time.</p><p>Miss a day? Simply pick up where you left off. This roadmap rewards consistency, not perfection.</p>',
  post_excerpt = '21 days, one insight a day, drawn from the best books on healthy habits and self-compassion. Slides right into your habit tracker.'
WHERE ID = 158137;

-- 2) Eco bag + tee template: fix local dev image URLs, link the planet-page mention, fix the unclosed <p>
UPDATE wp_posts SET
  post_content = REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(post_content,
          'http://lullberry.local/wp-content/uploads/', 'https://www.lullberry.com/wp-content/uploads/'),
        'on the page <i>Lullberry and the planet</i>.', 'on the page <a href="/we-care-for-the-planet/"><i>Lullberry and the planet</i></a>.'),
      '</p><br />The parts are made in Vietnam', '</p><p>The parts are made in Vietnam'),
    '</p><br />Made in central America', '</p><p>Made in central America'
  )
WHERE post_type = 'product' AND post_title LIKE '%with inspiring secret note%';

-- 3) Terms of Use + The small print: renumber the duplicate "Section 20"
UPDATE wp_posts SET
  post_content = REPLACE(post_content,
    '<h3 class="wp-block-heading">Section 20 – Contact Information</h3>',
    '<h3 class="wp-block-heading">Section 21 – Contact Information</h3>')
WHERE ID IN (9052, 158498);

-- 4) Supplier RFQ page: point the mailto at hello@lullberry.com
UPDATE wp_posts SET
  post_content = REPLACE(post_content,
    '<a href="mailto:christophe@lullberry.com">hello@lullberry.com</a>',
    '<a href="mailto:hello@lullberry.com">hello@lullberry.com</a>')
WHERE ID = 158419;

-- 5) Look at you! (kids edition): dead JS selector, title punctuation, local image URL, lb- prefix cleanup
UPDATE wp_posts SET
  post_content = REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(post_content,
          '.lb-wys-enso', '.ll-enso'),
        'Look at you.</h1>', 'Look at you!</h1>'),
      'http://lullberry.local/wp-content/uploads/team-1024x683.jpg', 'https://www.lullberry.com/wp-content/uploads/team-1024x683.jpg'),
    'lb-', 'll-'
  )
WHERE ID = 157237;

-- 6) Look at you! (adult): remove em-dash, fix local URL in "View all strengths" button
UPDATE wp_posts SET
  post_content = REPLACE(
    REPLACE(post_content,
      'A line of clothes to wear your strengths — with an inspiring secret message inside.',
      'A line of clothes to wear your strengths, with an inspiring secret message inside.'),
    'http://lullberry.local/wear-your-strength/?all', '/wear-your-strength/?all'
  )
WHERE ID = 154930;

-- 7) Jobs page: drop the flow/Maslow misattribution
UPDATE wp_posts SET
  post_content = REPLACE(post_content,
    'positive psychology and flow experiences, Maslow',
    'positive psychology, Maslow')
WHERE ID = 20036;

-- 8) Remove orphaned WPML nav menu items (11 unused foreign-language "Look at you!" links,
--    not attached to any menu, not linked as translations of anything).
--    NOT touching the "Apparel"/"Children's Apparel" items - those are legitimate,
--    living in two different active menus (Main and Shop).
DELETE FROM wp_posts WHERE ID IN (17560,17566,17572,20930,44777,44781,44784,44787,44790,44791,44792);
DELETE FROM wp_postmeta WHERE post_id IN (17560,17566,17572,20930,44777,44781,44784,44787,44790,44791,44792);
DELETE FROM wp_term_relationships WHERE object_id IN (17560,17566,17572,20930,44777,44781,44784,44787,44790,44791,44792);
DELETE FROM wp_icl_translations WHERE element_id IN (17560,17566,17572,20930,44777,44781,44784,44787,44790,44791,44792) AND element_type='post_nav_menu_item';

-- Clear cache
DELETE FROM wp_options WHERE option_name LIKE '%transient%';
