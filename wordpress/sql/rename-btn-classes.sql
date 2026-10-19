-- Rename ll-btn-primary → ll-btn-1, ll-btn-secondary → ll-btn-2
-- Affects: wp_posts (all post types incl. revisions)
-- Run: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/rename-btn-classes.sql

UPDATE wp_posts
SET post_content = REPLACE(
  REPLACE(post_content, 'll-btn-secondary', 'll-btn-2'),
  'll-btn-primary', 'll-btn-1'
)
WHERE post_content LIKE '%ll-btn-primary%'
   OR post_content LIKE '%ll-btn-secondary%';

SELECT ROW_COUNT() AS rows_updated;

-- Verify
SELECT ID, post_title, post_type, post_status
FROM wp_posts
WHERE post_content LIKE '%ll-btn-1%'
   OR post_content LIKE '%ll-btn-2%'
ORDER BY post_type, ID;
