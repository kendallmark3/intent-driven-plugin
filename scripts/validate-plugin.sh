#!/usr/bin/env bash
# Validates the required file structure and JSON manifests for intent-driven-plugin.
# Usage: ./scripts/validate-plugin.sh (run from anywhere; resolves paths relative to this script)
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail=0

check_file() {
  if [ ! -f "$1" ]; then
    echo "MISSING: $1"
    fail=1
  else
    echo "OK: $1"
  fi
}

check_json() {
  local file="$1"
  if [ ! -f "$file" ]; then
    return
  fi
  if command -v python3 >/dev/null 2>&1; then
    if ! python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$file" 2>/dev/null; then
      echo "INVALID JSON: $file"
      fail=1
    else
      echo "VALID JSON: $file"
    fi
  elif command -v node >/dev/null 2>&1; then
    if ! node -e "JSON.parse(require('fs').readFileSync(process.argv[1], 'utf8'))" "$file" 2>/dev/null; then
      echo "INVALID JSON: $file"
      fail=1
    else
      echo "VALID JSON: $file"
    fi
  else
    echo "SKIPPED JSON check for $file (no python3 or node found)"
  fi
}

echo "Checking required files..."
check_file ".claude-plugin/plugin.json"
check_file ".claude-plugin/marketplace.json"
check_file "commands/intent-check.md"
check_file "skills/repository-intent-analysis/SKILL.md"
check_file "README.md"
check_file "LICENSE"
check_file "CHANGELOG.md"
check_file "CONTRIBUTING.md"

echo
echo "Checking JSON manifests..."
check_json ".claude-plugin/plugin.json"
check_json ".claude-plugin/marketplace.json"

echo
if command -v claude >/dev/null 2>&1; then
  echo "Running 'claude plugin validate .' ..."
  claude plugin validate . || fail=1
else
  echo "Claude Code CLI not found on PATH; skipping 'claude plugin validate .'"
fi

echo
if [ "$fail" -ne 0 ]; then
  echo "Validation FAILED."
  exit 1
fi
echo "Validation passed."
