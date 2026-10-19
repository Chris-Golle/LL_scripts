DELETE FROM wp_options WHERE option_name LIKE '%_transient_%template%';
DELETE FROM wp_options WHERE option_name LIKE '%_transient_%block%';
DELETE FROM wp_options WHERE option_name LIKE '%_site_transient_%';
