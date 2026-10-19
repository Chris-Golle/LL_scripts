-- Strip numbered ll-sN classes (ll-s1, ll-s2, ll-s3) from all published/draft posts.
-- Handles both HTML class attrs ( ll-s1) and JSON block attrs ("ll-s1").

UPDATE wp_posts
SET post_content =
  REPLACE(REPLACE(REPLACE(
  REPLACE(REPLACE(REPLACE(
    post_content,
    ' ll-s1', ''), ' ll-s2', ''), ' ll-s3', ''),
    '"ll-s1"', '""'), '"ll-s2"', '""'), '"ll-s3"', '""')
WHERE (post_content LIKE '%ll-s1%'
    OR post_content LIKE '%ll-s2%'
    OR post_content LIKE '%ll-s3%')
  AND post_type NOT IN ('revision', 'auto-draft')
  AND post_status IN ('publish', 'draft');

SELECT ROW_COUNT() AS rows_updated;

-- Verify clean
SELECT ID, post_title FROM wp_posts
WHERE (post_content LIKE '%ll-s1%' OR post_content LIKE '%ll-s2%' OR post_content LIKE '%ll-s3%')
  AND post_type NOT IN ('revision', 'auto-draft');
