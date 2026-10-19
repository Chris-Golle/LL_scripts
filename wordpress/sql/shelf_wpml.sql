-- WPML: register the /shelf page as English, or WPML hides it (404).
SET @page := (SELECT ID FROM wp_posts WHERE post_type='page' AND post_name='shelf' AND post_status='publish' ORDER BY ID LIMIT 1);
SET @trid := (SELECT MAX(trid) + 1 FROM wp_icl_translations);

INSERT IGNORE INTO wp_icl_translations (element_type, element_id, trid, language_code, source_language_code)
SELECT 'post_page', @page, @trid, 'en', NULL FROM DUAL WHERE @page IS NOT NULL;

SELECT * FROM wp_icl_translations WHERE element_type='post_page' AND element_id=@page;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
