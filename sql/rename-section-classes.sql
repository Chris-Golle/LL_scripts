-- Rename retired .ll-section--* recipe classes to the new ll-bg-* plate/color classes.
-- .ll-section--dark had no fixed image identity, so it defaults to ll-bg-wood-dark1 here.
-- Hand-edit any of these in the editor afterward to pick a different plate (dark2/dark3/satin-dark1)
-- for visual variety across sections -- that's the whole point of having more than one.

UPDATE wp_posts
SET post_content = REPLACE(
                     REPLACE(
                      REPLACE(
                       REPLACE(
                        REPLACE(
                         REPLACE(post_content, 'll-section--dark', 'll-bg-wood-dark1'),
                        'll-section--fabric', 'll-bg-satin-dark1'),
                       ' ll-bg-dark', ''),
                      'll-section--light', 'll-bg-color-light1'),
                     'll-section--white', 'll-bg-color-light2'),
                    'll-section--birch', 'll-bg-color-light3')
WHERE ID IN (7480, 8326, 9106, 9156, 17185, 26580, 144108, 146523, 154930, 156154, 158583);

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
