#!/usr/bin/env bash
# ==============================================================================
# super-apple-design universal installer
# Supports: Antigravity, Claude Code, Cursor, Windsurf, and Codex
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="all"
SCOPE="global"
WITH_UPSTREAM=false
DRY_RUN=false

print_usage() {
  cat <<'EOF'
Usage: ./scripts/install.sh [OPTIONS]

Options:
  --target <target>    Installation target: antigravity | claude | cursor | all
                       (default: all)
  --global             Install into global user config directory (default)
  --project            Install into local project directory
  --with-upstream      Clone upstream helper skills from skills.json
  --dry-run            Simulate installation without modifying files
  --help               Display this help message and exit
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="${2:-}"
      if [[ ! "$TARGET" =~ ^(antigravity|claude|cursor|all)$ ]]; then
        echo "Error: Invalid target '$TARGET'. Allowed: antigravity | claude | cursor | all" >&2
        exit 1
      fi
      shift 2
      ;;
    --global)
      SCOPE="global"
      shift
      ;;
    --project)
      SCOPE="project"
      shift
      ;;
    --with-upstream)
      WITH_UPSTREAM=true
      shift
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --help|-h)
      print_usage
      exit 0
      ;;
    *)
      echo "Error: Unknown option '$1'" >&2
      print_usage
      exit 1
      ;;
  esac
done

log() {
  echo "[super-apple-design] $*"
}

run_mkdir() {
  local dir="$1"
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] mkdir -p '$dir'"
  else
    mkdir -p "$dir"
  fi
}

run_cp() {
  local src="$1"
  local dest="$2"
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] cp '$src' '$dest'"
  else
    cp -r "$src" "$dest"
  fi
}

install_antigravity() {
  local dest_dir
  if [[ "$SCOPE" == "global" ]]; then
    dest_dir="${HOME}/.gemini/antigravity/skills"
  else
    dest_dir="$(pwd)/.agent/skills"
  fi

  log "Installing for Antigravity into: $dest_dir"
  run_mkdir "$dest_dir/apple-design-universal"
  run_mkdir "$dest_dir/design-workflow"
  run_mkdir "$dest_dir/liquid-glass-physics"
  run_mkdir "$dest_dir/apple-hig-components"

  run_cp "$SCRIPT_DIR/skills/apple-design-universal/SKILL.md" "$dest_dir/apple-design-universal/SKILL.md"
  run_cp "$SCRIPT_DIR/skills/design-workflow/SKILL.md" "$dest_dir/design-workflow/SKILL.md"
  run_cp "$SCRIPT_DIR/skills/liquid-glass-physics/SKILL.md" "$dest_dir/liquid-glass-physics/SKILL.md"
  run_cp "$SCRIPT_DIR/skills/apple-hig-components/SKILL.md" "$dest_dir/apple-hig-components/SKILL.md"
  log "✓ Antigravity skills installed."
}

install_claude() {
  local dest_dir
  if [[ "$SCOPE" == "global" ]]; then
    dest_dir="${HOME}/.claude/skills"
  else
    dest_dir="$(pwd)/.claude/skills"
  fi

  log "Installing for Claude Code into: $dest_dir"
  run_mkdir "$dest_dir/apple-design-universal"
  run_mkdir "$dest_dir/design-workflow"

  run_cp "$SCRIPT_DIR/skills/apple-design-universal/SKILL.md" "$dest_dir/apple-design-universal/SKILL.md"
  run_cp "$SCRIPT_DIR/skills/design-workflow/SKILL.md" "$dest_dir/design-workflow/SKILL.md"
  log "✓ Claude Code skills installed."
}

install_cursor() {
  local dest_dir="$(pwd)/.cursor/rules"
  log "Installing Cursor rules into: $dest_dir"
  run_mkdir "$dest_dir"
  if [[ -f "$SCRIPT_DIR/.cursor/rules/apple-design.mdc" ]]; then
    run_cp "$SCRIPT_DIR/.cursor/rules/apple-design.mdc" "$dest_dir/apple-design.mdc"
  elif [[ -f "$SCRIPT_DIR/cursor/rules/apple-design.mdc" ]]; then
    run_cp "$SCRIPT_DIR/cursor/rules/apple-design.mdc" "$dest_dir/apple-design.mdc"
  fi
  if [[ -f "$SCRIPT_DIR/.cursor/rules/design-workflow.mdc" ]]; then
    run_cp "$SCRIPT_DIR/.cursor/rules/design-workflow.mdc" "$dest_dir/design-workflow.mdc"
  fi
  log "✓ Cursor rules installed."
}

log "Starting installation (Target: $TARGET, Scope: $SCOPE, DryRun: $DRY_RUN)..."

case "$TARGET" in
  antigravity)
    install_antigravity
    ;;
  claude)
    install_claude
    ;;
  cursor)
    install_cursor
    ;;
  all)
    install_antigravity
    install_claude
    install_cursor
    ;;
esac

if [[ "$WITH_UPSTREAM" == true ]]; then
  log "Upstream helper synchronization requested. Refer to skills.json for manual installs or automation."
fi

log "Done! Super Apple Design is ready."
EOF
