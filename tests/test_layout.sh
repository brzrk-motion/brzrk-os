#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail=0
assert_file() {
  if [[ ! -e "$1" ]]; then
    printf 'FAIL missing %s\n' "$1" >&2
    fail=1
  fi
}
assert_exec() {
  if [[ ! -x "$1" ]]; then
    printf 'FAIL not executable %s\n' "$1" >&2
    fail=1
  fi
}

assert_file "${ROOT}/manifests/base.packages"
assert_file "${ROOT}/manifests/cachyos.packages"
assert_file "${ROOT}/config/dconf/00-brzrk.conf"
assert_exec "${ROOT}/scripts/brzrk-validate"
assert_exec "${ROOT}/scripts/brzrk-apply"
assert_exec "${ROOT}/scripts/brzrk-check"

# No proprietary installer blobs
if find "${ROOT}" -type f \( -name '*.run' -o -name '*.exe' -o -name '*.dmg' \) | grep -q .; then
  printf 'FAIL proprietary installer artifacts present\n' >&2
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
printf 'OK layout tests\n'
