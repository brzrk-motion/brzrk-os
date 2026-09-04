#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Every Arch manifest package must appear exactly once when de-duplicated
# across a single file (no blank-line-only files, no duplicate entries).
check_manifest() {
  local file="$1"
  local pkgs tmp
  tmp="$(mktemp)"
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" ]] && continue
    printf '%s\n' "$line"
  done <"$file" >"$tmp"
  pkgs="$(wc -l <"$tmp")"
  [[ "$pkgs" -gt 0 ]] || { printf 'FAIL empty %s\n' "$file" >&2; rm -f "$tmp"; return 1; }
  if [[ "$(sort "$tmp" | uniq -d | wc -l)" -ne 0 ]]; then
    printf 'FAIL duplicate packages in %s:\n' "$file" >&2
    sort "$tmp" | uniq -d >&2
    rm -f "$tmp"
    return 1
  fi
  # Package names: lowercase arch style
  if grep -E -v '^[a-z0-9@._+-]+$' "$tmp" >/dev/null; then
    printf 'FAIL invalid package name(s) in %s\n' "$file" >&2
    grep -E -v '^[a-z0-9@._+-]+$' "$tmp" >&2 || true
    rm -f "$tmp"
    return 1
  fi
  rm -f "$tmp"
  printf 'OK %s\n' "$(basename "$file")"
}

shopt -s nullglob
for f in "${ROOT}"/manifests/*.packages; do
  check_manifest "$f"
done

# Ensure validate script agrees with pacman for Arch manifests
"${ROOT}/scripts/brzrk-validate" >/dev/null
printf 'OK manifests + pacman resolve\n'
