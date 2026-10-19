-- Etymology corrections, 2026-07-06 (part 3)
-- Run with: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/etymology-fixes-2026-07-06.sql

-- Hope: fabricated PIE root "kewp / rising vapor" replaced with the real, verifiable root
UPDATE wp_termmeta SET
  meta_value = 'from Old English hopian which means <span>to expect with trust</span>\r\n(noun) <span class="highlight">the ability to trust in what will come</span>'
WHERE meta_id = 3134;

-- Joy: "vita / life" was the Vitality root, not Joy's. Correct root is Latin gaudium.
UPDATE wp_termmeta SET
  meta_value = 'from Latin gaudium which means <span>a burst of delight</span>\r\n(noun) <span class="highlight">the impulse to celebrate being alive</span>'
WHERE meta_id = 3149;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
