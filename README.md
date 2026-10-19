# Lullberry scripts

One-off and maintenance scripts for lullberry.com.

- `sql/` : SQL and PHP fix scripts, run with `mysql -u root -proot local < file.sql`
- `root/` : CSS audit / PurgeCSS tooling and ACF import helpers

Not included: `local.sql` (full DB dump), media files, query output dumps.
- `print-sheets/` : Python builders for the printable series PDFs
- `woo/` : WooCommerce REST API scripts (products, categories, ACF). Set `WC_CONSUMER_KEY` and `WC_CONSUMER_SECRET` in your shell before running.
