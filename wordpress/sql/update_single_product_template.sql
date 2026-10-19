-- Update single-product FSE template
-- Add lb-product-hero class to s1 section for gap fix

UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  '{"align":"full","className":"lb-s1","layout":{"type":"constrained"}} -->\n  <div class="wp-block-group alignfull lb-s1">',
  '{"align":"full","className":"lb-s1 lb-product-hero","layout":{"type":"constrained"}} -->\n  <div class="wp-block-group alignfull lb-s1 lb-product-hero">'
),
post_modified = NOW(),
post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 157476;
