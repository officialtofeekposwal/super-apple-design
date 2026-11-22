#!/usr/bin/env bash
# super-design-skills installer
#
# Usage:
#   ./install.sh --target claude|antigravity|cursor|all [--project|--global] [--with-upstream] [--dry-run]
#
# Examples:
#   ./install.sh --target claude --global
#   ./install.sh --target antigravity --project --with-upstream
#   ./install.sh --target all --project --dry-run

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="claude"
SCOPE="global"
UPSTREAM=0
DRY=0
CACHE="${SDS_CACHE:-$HOME/.super-design-skills/upstream}"

usage() { sed -n '2,11p' "$0" | sed 's/^# \{0,1\}//'; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)        TARGET="${2:-}"; shift 2 ;;
    --project)       SCOPE="project"; shift ;;
    --global)        SCOPE="global"; shift ;;
    --with-upstream) UPSTREAM=1; shift ;;
    --dry-run)       DRY=1; shift ;;
    -h|--help)       usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

case "$TARGET" in claude|antigravity|cursor|all) ;; *) echo "Invalid --target: $TARGET" >&2; usage; exit 1 ;; esac

# Run a command, or only print it in dry-run mode.
run() {
  if [[ $DRY -eq 1 ]]; then printf '[dry-run]'; printf ' %q' "$@"; printf '\n'; else "$@"; fi
}

say() { if [[ $DRY -eq 1 ]]; then echo "  would install: $*"; else echo "  installed: $*"; fi; }

skills_dir() {
  case "$1:$SCOPE" in
    claude:global)       echo "$HOME/.claude/skills" ;;
    claude:project)      echo "$PWD/.claude/skills" ;;
    antigravity:global)  echo "$HOME/.gemini/antigravity/skills" ;;
    antigravity:project) echo "$PWD/.agent/skills" ;;
    *) echo "" ;;
  esac
}

install_own() {
  local dest="$1" s
  run mkdir -p "$dest"
  for s in apple-design-universal design-workflow; do
    run rm -rf "$dest/$s"
    run cp -R "$HERE/skills/$s" "$dest/$s"
    say "$s -> $dest/$s"
  done
}

install_upstream() {
  local dest="$1" id repo found d name f pairs
  if ! command -v git >/dev/null 2>&1; then echo "  git not found, skipping upstream skills"; return; fi
  if ! command -v python3 >/dev/null 2>&1; then echo "  python3 not found, skipping upstream skills"; return; fi
  run mkdir -p "$CACHE"
  pairs="$(mktemp)"
  python3 - "$HERE/skills.json" > "$pairs" <<'PY'
import json, sys
for u in json.load(open(sys.argv[1]))["upstream"]:
    print(u["id"], u["repo"])
PY
  while read -r id repo; do
    echo "- $id"
    if [[ -d "$CACHE/$id/.git" ]]; then
      run git -C "$CACHE/$id" pull --ff-only -q || echo "  could not update (continuing)"
    else
      run git clone --depth 1 -q "$repo" "$CACHE/$id" || { echo "  could not clone $repo (check network or URL). Continuing."; continue; }
    fi
    [[ $DRY -eq 1 ]] && continue
    found=0
    while IFS= read -r f; do
      d="$(dirname "$f")"; name="$(basename "$d")"
      [[ "$d" == "$CACHE/$id" ]] && name="$id"
      rm -rf "$dest/$name"; cp -R "$d" "$dest/$name"
      echo "  skill: $name"; found=1
    done < <(find "$CACHE/$id" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/.git/*' 2>/dev/null)
    if [[ $found -eq 0 ]]; then
      echo "  this is a tool/library, install it from Claude Code by pasting the repo link and 'Install this skill, then confirm it works.'  ($repo)"
    fi
  done < "$pairs"
  rm -f "$pairs"
}

install_cursor() {
  local dest="$PWD/.cursor/rules"
  [[ "$SCOPE" == "global" ]] && echo "  note: Cursor rules live inside a project, using the current folder"
  run mkdir -p "$dest"
  run cp "$HERE/cursor/rules/apple-design.mdc" "$dest/apple-design.mdc"
  say "apple-design.mdc -> $dest"
}

echo "super-design-skills | target=$TARGET scope=$SCOPE upstream=$UPSTREAM dry-run=$DRY"
if [[ "$TARGET" == "all" ]]; then TARGETS="claude antigravity cursor"; else TARGETS="$TARGET"; fi

for t in $TARGETS; do
  echo "== $t"
  if [[ "$t" == "cursor" ]]; then install_cursor; continue; fi
  d="$(skills_dir "$t")"
  install_own "$d"
  if [[ $UPSTREAM -eq 1 ]]; then install_upstream "$d"; fi
done

echo "Done. Restart your tool, then type / to see the skills."
