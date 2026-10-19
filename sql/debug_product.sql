-- Run this to diagnose why the product page shows the old homepage
-- Expected: should show template, elementor mode, and any location override

SELECT meta_key, LEFT(meta_value, 200) as meta_value 
FROM wp_postmeta 
WHERE post_id = 157457 
AND meta_key IN (
  '_wp_page_template',
  '_elementor_template_type', 
  '_elementor_edit_mode',
  '_elementor_location',
  '_elementor_conditions'
)
ORDER BY meta_key;

-- Also check if any Elementor template is set to display on ALL products
SELECT p.ID, p.post_title, pm.meta_key, LEFT(pm.meta_value, 200) as meta_value
FROM wp_posts p
JOIN wp_postmeta pm ON p.ID = pm.post_id
WHERE p.post_type IN ('elementor_library', 'wp_template', 'wp_template_part')
AND pm.meta_key IN ('_elementor_conditions', '_elementor_location')
AND pm.meta_value LIKE '%product%'
LIMIT 10;
