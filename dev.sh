#!/bin/sh
# Dev build: unpacked themes in dev/<name>/ for "Load Temporary Add-on",
# plus personal .xpi files in dev/xpi/. The id gets a "-dev" suffix and the
# update_url is removed, so upstream updates never overwrite local changes.
# Usage: ./dev.sh            (rebuild everything)
#        ./dev.sh --watch    (rebuild on each change in src/ or themes/)
set -eu
cd "$(dirname "$0")"

build() {
  rm -rf dev
  mkdir -p dev/xpi
  # Thunderbird caches stylesheets by URL, and a reloaded temporary add-on
  # keeps its URL. A new file name on every build forces a fresh load.
  css="theme-$(date +%s).css"
  for dir in themes/*/; do
    key=$(basename "$dir")
    out="dev/$key"
    mkdir -p "$out"
    sed -e '/"update_url"/d' \
        -e 's/"strict_min_version": "\([^"]*\)",/"strict_min_version": "\1"/' \
        -e 's/\("id": "[^"@]*\)@/\1-dev@/' \
        -e 's/^\(  "name": "[^"]*\)"/\1 (dev)"/' \
        -e "s/\"stylesheet\": \"theme.css\"/\"stylesheet\": \"$css\"/" \
        "${dir}manifest.json" > "$out/manifest.json"
    name=$(sed -n 's/^  "name": "\([^"]*\)".*/\1/p' "$out/manifest.json")
    sed "s/@NAME@/$name/; s/@VERSION@/dev/" src/theme.css > "$out/$css"
    case "$key" in *mono*) cat src/mono.css >> "$out/$css" ;; esac
    case "$key" in hpe-*) cat src/hpe.css >> "$out/$css" ;; esac
    (cd "$out" && zip -qX "../xpi/$key-dev.xpi" manifest.json "$css")
  done
  echo "[$(date +%H:%M:%S)] dev/ rebuilt"
}

build
if [ "${1:-}" = "--watch" ]; then
  last=""
  while sleep 1; do
    # Hash file names and contents: works with both BSD and GNU tools.
    now=$(find src themes -type f | LC_ALL=C sort | while IFS= read -r f; do printf '%s ' "$f"; cksum < "$f"; done | cksum)
    [ "$now" = "$last" ] || { [ -z "$last" ] || build; last="$now"; }
  done
fi
