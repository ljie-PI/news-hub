#!/bin/bash
# Import digest and deep-dive content into Astro
# Usage: ./scripts/import-content.sh [deep_dive_batch...]
# Without args: imports all deep-dive batches + all digest files

set -euo pipefail

NEWS_DIR="$HOME/.openclaw/workspace/news-monitor"
DEEP_DIVE_DIR="$NEWS_DIR/deep_dive"
SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DIGEST_CONTENT="$SITE_DIR/src/content/digest"
DEEP_DIVE_CONTENT="$SITE_DIR/src/content/deep-dive"
mkdir -p "$DIGEST_CONTENT" "$DEEP_DIVE_CONTENT"

# ── Digest import ──
import_digest() {
  local file="$1"
  local basename="$(basename "$file" .md)"
  # basename like: github_2026-04-20_06
  local platform="${basename%%_*}"
  local rest="${basename#*_}"  # 2026-04-20_06
  local date="${rest%%_*}"     # 2026-04-20
  local hour="${rest##*_}"      # 06
  local generated="${date} ${hour}:00"

  local source
  case "$platform" in
    github)      source="GitHub" ;;
    hackernews)  source="HN" ;;
    reddit)      source="Reddit" ;;
    producthunt) source="PH" ;;
    *)           return ;;
  esac

  local source_name
  case "$platform" in
    github)      source_name="GitHub Trending" ;;
    hackernews)  source_name="Hacker News" ;;
    reddit)      source_name="Reddit" ;;
    producthunt) source_name="Product Hunt" ;;
    *)           source_name="$source" ;;
  esac
  local title="${source_name} 日报 ${date}"

  local slug="${basename}"
  local dest="$DIGEST_CONTENT/${slug}.md"
  [ -f "$dest" ] && { echo "  skip digest: $slug"; return; }

  {
    echo "---"
    echo "title: \"${title//\"/\\\"}\""
    echo "date: \"$date\""
    echo "generated: \"$generated\""
    echo "source: \"$source\""
    echo "slug: \"$slug\""
    echo "---"
    echo ""
    cat "$file"
  } > "$dest"
  echo "  added digest: $slug"
}

echo "=== Importing Digests ==="
for f in "$NEWS_DIR"/github_*.md "$NEWS_DIR"/hackernews_*.md "$NEWS_DIR"/reddit_*.md "$NEWS_DIR"/producthunt_*.md; do
  [ -f "$f" ] && import_digest "$f"
done

# ── Deep Dive import ──
import_deep_dive() {
  local file="$1"
  local batch="$2"
  local rel="${file#*/deep_dive/$batch/}"
  local dir_part="${rel%%/*}"
  local basename="$(basename "$file" .md)"
  local date="${batch%%_*}"
  local hour="${batch##*_}"
  local generated="${date} ${hour}:00"

  local source
  case "$dir_part" in
    hackernews) source="HN" ;;
    reddit)     source="Reddit" ;;
    github)     source="GitHub" ;;
    producthunt) source="PH" ;;
    *)          source="$dir_part" ;;
  esac

  local slug="${batch}-${basename}"
  local dest="$DEEP_DIVE_CONTENT/${slug}.md"

  local title
  title=$(grep -m1 '^# ' "$file" | sed 's/^# //' || echo "$basename")
  [ -z "$title" ] && title="$basename"

  local summary
  summary=$(awk 'BEGIN{found=0} /^# /{found=1;next} found && /^[^>#\[]/ && NF{print;exit}' "$file" | head -c 200 || echo "")
  summary="${summary//\"/\\\"}"

  [ -f "$dest" ] && { echo "  skip deep-dive: $slug"; return; }

  {
    echo "---"
    echo "title: \"${title//\"/\\\"}\""
    echo "date: \"$date\""
    echo "generated: \"$generated\""
    echo "source: \"$source\""
    echo "slug: \"$slug\""
    [ -n "$summary" ] && echo "summary: \"$summary\""
    echo "---"
    echo ""
    cat "$file"
  } > "$dest"
  echo "  added deep-dive: $slug"
}

echo "=== Importing Deep Dives ==="
if [ $# -ge 1 ]; then
  batches=("$@")
else
  batches=($(ls "$DEEP_DIVE_DIR" | sort))
fi

for batch in "${batches[@]}"; do
  echo "Batch: $batch"
  find "$DEEP_DIVE_DIR/$batch" -name '*.md' -type f | sort | while read -r f; do
    import_deep_dive "$f" "$batch"
  done
done

echo "Done."
