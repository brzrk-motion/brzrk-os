#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"${ROOT}/scripts/brzrk-iso" --check >/dev/null

grep -Fq 'AutomaticLogin=liveuser' "${ROOT}/iso/airootfs/etc/gdm/custom.conf"
grep -Fq 'dconf update' "${ROOT}/iso/airootfs/root/customize_airootfs.sh"
grep -Fq 'cachyos-calamares-next' "${ROOT}/iso/live.packages"
grep -Fq 'linux-cachyos' "${ROOT}/iso/live.packages"

printf 'OK ISO profile tests\n'
