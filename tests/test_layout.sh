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
assert_file "${ROOT}/config/ghostty/config"
assert_file "${ROOT}/config/starship/starship.toml"
assert_file "${ROOT}/config/shell/brzrk-starship.sh"
assert_exec "${ROOT}/scripts/brzrk-validate"
assert_exec "${ROOT}/scripts/brzrk-apply"
assert_exec "${ROOT}/scripts/brzrk-check"
assert_exec "${ROOT}/scripts/brzrk-iso"
assert_file "${ROOT}/iso/profiledef.sh"
assert_file "${ROOT}/iso/live.packages"
assert_file "${ROOT}/iso/airootfs/etc/gdm/custom.conf"
assert_file "${ROOT}/iso/airootfs/etc/os-release"
assert_exec "${ROOT}/iso/airootfs/root/customize_airootfs.sh"

# No proprietary installer blobs
if find "${ROOT}" -type f \( -name '*.run' -o -name '*.exe' -o -name '*.dmg' \) | grep -q .; then
  printf 'FAIL proprietary installer artifacts present\n' >&2
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
printf 'OK layout tests\n'
