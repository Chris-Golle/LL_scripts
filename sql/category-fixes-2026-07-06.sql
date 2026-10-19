-- Category page fixes, 2026-07-06 (part 2)
-- Run with: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/category-fixes-2026-07-06.sql

-- Humility traits: remove em-dash
UPDATE wp_termmeta SET
  meta_value = REPLACE(meta_value, 'think of yourself a little less — but don''t think less of yourself', 'think of yourself a little less, but don''t think less of yourself')
WHERE meta_id = 3141;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
