#!/usr/bin/env bash
# blueprints-skill installer
# Installs the Blueprints Agent Skill into the cross-tool global skills directory.
# Works for OpenCode, Claude Code (newer), Codex, Gemini CLI, Cursor, and any
# tool that reads ~/.agents/skills, ~/.claude/skills, or ~/.config/opencode/skills.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/siddheshbmane/blueprints-skill/main/install.sh | bash
#   # or: bash <(curl -fsSL <url>) [--copy]
#
# By default this symlinks (stays in sync with the cloned repo + future git pulls).
# Pass --copy to copy instead of symlink.

set -euo pipefail

REPO_URL="https://github.com/siddheshbmane/blueprints-skill.git"
TMP_DIR="$(mktemp -d)"
MODE="symlink"
[ "${1:-}" = "--copy" ] && MODE="copy"

echo "=== Installing Blueprints skill (mode: $MODE) ==="

# Clone repo
echo "[1/4] Cloning $REPO_URL ..."
git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1

SRC="$TMP_DIR/blueprints"
if [ ! -f "$SRC/SKILL.md" ]; then
  echo "ERROR: SKILL.md not found in clone — aborting." >&2
  rm -rf "$TMP_DIR"
  exit 1
fi

installed=0
install_to() {
  local dest_root="$1"
  mkdir -p "$dest_root"
  if [ -e "$dest_root/blueprints" ] && [ ! -L "$dest_root/blueprints" ]; then
    echo "  [skip] $dest_root/blueprints already exists as a real dir"
    return
  fi
  if [ "$MODE" = "symlink" ]; then
    ln -sfn "$SRC" "$dest_root/blueprints"
    echo "  [link] $dest_root/blueprints -> $SRC"
  else
    cp -R "$SRC" "$dest_root/blueprints"
    echo "  [copy] $dest_root/blueprints"
  fi
  installed=1
}

echo "[2/4] Installing to global skill locations ..."
install_to "$HOME/.agents/skills"
install_to "$HOME/.claude/skills"
install_to "$HOME/.config/opencode/skills"

if [ "$installed" -eq 0 ]; then
  echo "NOTE: Existing installs found — nothing overwritten. Remove them first if you want to refresh."
fi

echo "[3/4] Verifying structure ..."
if [ -d "$HOME/.agents/skills/blueprints" ] || [ -d "$HOME/.claude/skills/blueprints" ] || [ -d "$HOME/.config/opencode/skills/blueprints" ]; then
  echo "  [ok] skill found in at least one location"
else
  echo "  [warn] no skill located — check permissions"
fi

echo "[4/4] Cleaning up ..."
rm -rf "$TMP_DIR"

echo
echo "=== Installed! ==="
echo "Try: bash ~/.agents/skills/blueprints/scripts/preflight.sh"
echo "Then open your AI tool and say: \"Follow the blueprints. Build: <your idea>\""