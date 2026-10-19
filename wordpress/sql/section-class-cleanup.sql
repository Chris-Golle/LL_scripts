-- =============================================================
-- Section class cleanup + buy-card migration
-- Run: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/section-class-cleanup.sql
-- =============================================================

-- 1. ll-dark-section  ->  ll-section ll-section--dark
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"ll-dark-section"',  '"className":"ll-section ll-section--dark"'),
  '"className":"ll-dark-section ',  '"className":"ll-section ll-section--dark '),
  ' ll-dark-section"',              ' ll-section ll-section--dark"'),
  ' ll-dark-section ',              ' ll-section ll-section--dark ')
WHERE post_content LIKE '%ll-dark-section%';

-- 2. ll-light-section  ->  ll-section ll-section--light
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"ll-light-section"', '"className":"ll-section ll-section--light"'),
  '"className":"ll-light-section ', '"className":"ll-section ll-section--light '),
  ' ll-light-section"',             ' ll-section ll-section--light"'),
  ' ll-light-section ',             ' ll-section ll-section--light ')
WHERE post_content LIKE '%ll-light-section%';

-- 3. ll-white-section  ->  ll-section ll-section--white
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"ll-white-section"', '"className":"ll-section ll-section--white"'),
  '"className":"ll-white-section ', '"className":"ll-section ll-section--white '),
  ' ll-white-section"',             ' ll-section ll-section--white"'),
  ' ll-white-section ',             ' ll-section ll-section--white ')
WHERE post_content LIKE '%ll-white-section%';

-- 4. lb-s1 (JSON) + ll-s1 (HTML)  ->  ll-section ll-section--light
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"lb-s1"',            '"className":"ll-section ll-section--light"'),
  '"className":"lb-s1 ',            '"className":"ll-section ll-section--light '),
  '"className":"ll-s1"',            '"className":"ll-section ll-section--light"'),
  '"className":"ll-s1 ',            '"className":"ll-section ll-section--light '),
  ' ll-s1"',                        ' ll-section ll-section--light"'),
  ' ll-s1 ',                        ' ll-section ll-section--light ')
WHERE post_content LIKE '% ll-s1%' OR post_content LIKE '%"lb-s1%' OR post_content LIKE '%"ll-s1%';

-- 5. lb-s2 (JSON) + ll-s2 (HTML)  ->  ll-section
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"lb-s2"',            '"className":"ll-section"'),
  '"className":"lb-s2 ',            '"className":"ll-section '),
  '"className":"ll-s2"',            '"className":"ll-section"'),
  '"className":"ll-s2 ',            '"className":"ll-section '),
  ' ll-s2"',                        ' ll-section"'),
  ' ll-s2 ',                        ' ll-section ')
WHERE post_content LIKE '% ll-s2%' OR post_content LIKE '%"lb-s2%' OR post_content LIKE '%"ll-s2%';

-- 6. lb-s3 (JSON) + ll-s3 (HTML)  ->  ll-section ll-section--birch
UPDATE wp_posts SET post_content = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
  post_content,
  '"className":"lb-s3"',            '"className":"ll-section ll-section--birch"'),
  '"className":"lb-s3 ',            '"className":"ll-section ll-section--birch '),
  '"className":"ll-s3"',            '"className":"ll-section ll-section--birch"'),
  '"className":"ll-s3 ',            '"className":"ll-section ll-section--birch '),
  ' ll-s3"',                        ' ll-section ll-section--birch"'),
  ' ll-s3 ',                        ' ll-section ll-section--birch ')
WHERE post_content LIKE '% ll-s3%' OR post_content LIKE '%"lb-s3%' OR post_content LIKE '%"ll-s3%';

-- 7. Drop product-fullscreen-button (ll-buy-card is now the sole trigger)
UPDATE wp_posts SET post_content = REPLACE(REPLACE(
  post_content,
  ' product-fullscreen-button"',    '"'),
  ' product-fullscreen-button ',    ' ')
WHERE post_content LIKE '%product-fullscreen-button%';

-- 8. Clear transients
DELETE FROM wp_options WHERE option_name LIKE '%transient%';
