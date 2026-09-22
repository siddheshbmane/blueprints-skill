#!/usr/bin/env bash
# Blueprints preflight tool check (from heart.md §21.1)
# Run at the start of any new blueprint project.
set -uo pipefail

echo "=== BLUEPRINTS PREFLIGHT TOOL CHECK ==="
fail=0

check() {
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "  [ok]   $label"
  else
    echo "  [MISS] $label"
    fail=1
  fi
}

check "node 20+ (node --version)"   node --version
check "npm 10+ (npm --version)"     npm --version
check "pnpm 9+ (pnpm --version)"    pnpm --version
check "git (git --version)"         git --version
check "gh auth (gh auth status)"    gh auth status
check "vercel auth (vercel whoami)" vercel whoami
check "railway auth (railway whoami)" railway whoami
check "playwright (npx playwright --version)" npx playwright --version

echo
if [ "$fail" -eq 1 ]; then
  echo "Some tools are missing/needs auth. See references/tooling.md for install commands."
  exit 1
else
  echo "Preflight complete: all required tools available."
fi