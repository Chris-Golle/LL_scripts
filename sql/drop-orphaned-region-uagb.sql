-- Orphaned template parts tagged to inactive theme 'twentytwentythree-child'
-- (active theme = twentytwentyfive-child; these two rows are unreachable dead data)
DELETE FROM wp_term_relationships WHERE object_id IN (156249, 157144);
DELETE FROM wp_postmeta WHERE post_id IN (156249, 157144);
DELETE FROM wp_posts WHERE ID IN (156249, 157144);

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
