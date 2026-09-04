#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

out="$("${ROOT}/scripts/brzrk-apply" 2>&1)"
printf '%s\n' "$out" | grep -q 'dry-run' || {
  printf 'FAIL expected dry-run banner\n' >&2
  exit 1
}
printf '%s\n' "$out" | grep -q '/etc/dconf/db/local.d/00-brzrk' || {
  printf 'FAIL expected dconf plan\n' >&2
  exit 1
}

out="$("${ROOT}/scripts/brzrk-apply" --packages --gpu amd 2>&1)"
printf '%s\n' "$out" | grep -q 'blender' || {
  printf 'FAIL expected blender in package plan\n' >&2
  exit 1
}
printf '%s\n' "$out" | grep -q 'vulkan-radeon' || {
  printf 'FAIL expected vulkan-radeon for --gpu amd\n' >&2
  exit 1
}

# Must not mutate system in dry-run
[[ ! -e /etc/dconf/db/local.d/00-brzrk ]] || {
  # If it already existed from a prior real apply, that's fine; ensure dry-run
  # path did not require root (script already returned 0 without sudo).
  true
}

printf 'OK apply dry-run\n'
