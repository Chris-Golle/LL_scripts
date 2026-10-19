#!/usr/bin/env bash
# Gather every Lullberry script from where it lives into this repo, scrub secrets, commit.
# Usually run through ../push-all.sh. NO_PUSH=1 to skip pushing.
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
LULL="${LULL:-$HOME/Documents/Lullberry}"
DRIVE="${DRIVE:-$HOME/My Drive (christophe.golle@gmail.com)}"
WOO="$DRIVE/LL Prod 1 - Strengths/Scripts/woo"
ADOBE="$DRIVE/LL design/Adobe scripts"

copy() { # copy files with given extensions from $1 (top level only) into $2
  local src="$1" dst="$2"; shift 2
  [[ -d "$src" ]] || { echo "skip (missing): $src"; return; }
  mkdir -p "$dst"
  for ext in "$@"; do
    find "$src" -maxdepth 1 -type f -name "*.$ext" ! -name "local.sql" -exec cp {} "$dst/" \;
  done
}

cd "$REPO"
rm -rf wordpress css-audit woocommerce illustrator print-sheets
copy "$LULL/app/sql"              wordpress/sql   sql
copy "$LULL/app/sql"              wordpress/php   php
cp "$LULL/acf-import.php" "$LULL/fix-cat-template.php" wordpress/php/ 2>/dev/null || true
copy "$LULL"                      css-audit       js json
cp "$LULL/urls.txt" css-audit/ 2>/dev/null || true
rm -f css-audit/*.report.json css-audit/css-coverage-report.json
copy "$WOO"                       woocommerce     py
copy "$ADOBE"                     illustrator     jsx js py
copy "$LULL/print-sheets/source"  print-sheets    py json csv

# Secrets: WooCommerce keys -> env vars
for f in woocommerce/*.py; do
  [[ -f "$f" ]] || continue
  perl -pi -e 's/consumer_key="ck_\w+"/consumer_key=os.environ["WC_CONSUMER_KEY"]/; s/consumer_secret="cs_\w+"/consumer_secret=os.environ["WC_CONSUMER_SECRET"]/' "$f"
  grep -q '^import os' "$f" || perl -pi -e 'print "import os\n" if $. == 1' "$f"
done
if grep -rEln "(ck|cs)_[a-f0-9]{20,}" --exclude-dir=.git . || find . -path ./.git -prune -o -iname "*token*" -print | grep -q .; then echo "Secret found, aborting."; exit 1; fi

git add -A
if git diff --cached --quiet; then echo "Scripts: nothing new."; else git commit -q -m "Sync scripts $(date +%F)"; echo "Scripts: committed."; fi
[[ "${NO_PUSH:-}" == 1 ]] || git push -q -u origin main
