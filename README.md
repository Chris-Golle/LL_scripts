# Lullberry scripts

All Lullberry scripts in one place. Run `~/Documents/Lullberry/push-all.sh` to gather, commit and push.

| Folder | What | Source on disk |
|---|---|---|
| `wordpress/sql` | DB fix and query scripts: `mysql -u root -proot local < file.sql` | `Lullberry/app/sql` |
| `wordpress/php` | One-off WP helpers (menus, legal page, ACF import) | `Lullberry/app/sql`, `Lullberry/` |
| `css-audit` | PurgeCSS / CSS coverage tooling (`npm i` then `node css-coverage-audit.js`) | `Lullberry/` |
| `woocommerce` | REST API scripts for products and categories. Needs `WC_CONSUMER_KEY`, `WC_CONSUMER_SECRET` | `Drive/LL Prod 1 - Strengths/Scripts/woo` |
| `illustrator` | Adobe Illustrator ExtendScripts (ribbons, swatches, export) | `Drive/LL design/Adobe scripts` |
| `print-sheets` | Python builders for printable series PDFs | `Lullberry/print-sheets/source` |

Edit scripts where they live (source column); `sync.sh` copies them here. Excluded: `local.sql`, `to_delete/` folders, secrets.
