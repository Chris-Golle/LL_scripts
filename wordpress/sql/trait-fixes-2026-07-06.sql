-- Trait line fixes, 2026-07-06 (part 4)
-- Run with: mysql -u root -proot local < ~/Documents/Lullberry/app/sql/trait-fixes-2026-07-06.sql

-- "be vulnerable" de-duplication, one tailored line per category
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'sit with what''s uncomfortable before rushing to fix it') WHERE meta_id = 3088; -- Calm
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'admit, out loud, when you were hurt') WHERE meta_id = 3121; -- Forgiveness
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'show people your uncertainty, not just your certainty') WHERE meta_id = 3131; -- Honesty
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'receive kindness as openly as you give it') WHERE meta_id = 3156; -- Kindness
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'stay soft even when it''s risky') WHERE meta_id = 3166; -- Love
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'release the need to have all the answers') WHERE meta_id = 3176; -- Spirituality
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'be vulnerable', 'hold your certainty loosely') WHERE meta_id = 3186; -- Wisdom

-- Team spirit: remove duplicate fire imagery (Joy already owns "be on fire")
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'spread your warmth and your energy: be on fire', 'cheer loudest for someone else''s win') WHERE meta_id = 3181;

-- Discipline: smoother image, same meaning (vision to ground)
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'grab your vision by the feet and plant it on the ground', 'turn your vision into one small, doable step') WHERE meta_id = 3116;

-- Courage: rephrased to "recharge for tomorrow's battle"
UPDATE wp_termmeta SET meta_value = REPLACE(meta_value, 'get quality sleep, tomorrow is a new day', 'recharge tonight for tomorrow''s battle') WHERE meta_id = 3101;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
