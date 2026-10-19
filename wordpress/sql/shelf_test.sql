-- Shelf test: /shelf page + test books on the first two published 3D Ribbons.
-- Idempotent: skips anything already there. Edit books later in each
-- 3D Ribbon's "Shelf" box.

SET @b1 := (SELECT ID FROM wp_posts WHERE post_type='board_animation' AND post_status='publish' ORDER BY ID LIMIT 0,1);
SET @b2 := (SELECT ID FROM wp_posts WHERE post_type='board_animation' AND post_status='publish' ORDER BY ID LIMIT 1,1);

INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
SELECT @b1, '_ll_shelf', 'Radical Acceptance | Tara Brach | Gentle and exact: the kindest book on self-judgment I know. | 2, 8, 15\nHardwiring Happiness | Rick Hanson | Small good moments, taken in slowly, add up. The quiet science behind a ribbon. | 5, 12, 19\nWherever You Go, There You Are | Jon Kabat-Zinn | Short chapters, one breath each. I still open it at random. | 1, 21' FROM DUAL
WHERE @b1 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM wp_postmeta WHERE post_id=@b1 AND meta_key='_ll_shelf');

INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
SELECT @b2, '_ll_shelf', 'Full Catastrophe Living | Jon Kabat-Zinn | The long, patient version. Worth every page on a hard week. | 3, 10\nBuddha’s Brain | Rick Hanson & Richard Mendius | Where old practice and new neuroscience finally shake hands. | 6, 14, 20\nTrue Refuge | Tara Brach | For the days when the ribbon feels heavier than usual. | 9, 17' FROM DUAL
WHERE @b2 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM wp_postmeta WHERE post_id=@b2 AND meta_key='_ll_shelf');

INSERT INTO wp_posts
  (post_author, post_date, post_date_gmt, post_content, post_title, post_excerpt, post_status,
   comment_status, ping_status, post_name, to_ping, pinged, post_modified, post_modified_gmt,
   post_content_filtered, post_parent, guid, menu_order, post_type)
SELECT (SELECT MIN(ID) FROM wp_users), NOW(), UTC_TIMESTAMP(), '<!-- wp:group {"className":"ll-section","layout":{"type":"constrained","contentSize":"60rem"}} -->\n<div class="wp-block-group ll-section"><!-- wp:heading {"textAlign":"center","level":1} -->\n<h1 class="wp-block-heading has-text-align-center">Twenty-one days, from books I love.</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {"align":"center","className":"ll-lead"} -->\n<p class="has-text-align-center ll-lead">Each ribbon carries lines from books I’ve read and keep returning to. If a day stays with you, the whole book probably will too.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ll_shelf]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph {"align":"center","textColor":"ll-bark-light","fontSize":"small"} -->\n<p class="has-text-align-center has-ll-bark-light-color has-text-color has-small-font-size">No affiliate links. I just want you to read them.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->', 'The shelf', '', 'publish',
   'closed', 'closed', 'shelf', '', '', NOW(), UTC_TIMESTAMP(),
   '', 0, '', 0, 'page'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM wp_posts WHERE post_type='page' AND post_name='shelf' AND post_status<>'trash');

-- What landed
SELECT p.ID, p.post_title, 'ribbon with books' AS what FROM wp_posts p JOIN wp_postmeta m ON m.post_id=p.ID AND m.meta_key='_ll_shelf'
UNION ALL
SELECT ID, post_title, 'page /shelf' FROM wp_posts WHERE post_type='page' AND post_name='shelf';

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
