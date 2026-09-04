#!/usr/bin/env bash
set -euo pipefail

dconf update

cat > /etc/motd <<'EOF'
BRZRK OS

Creative workstation live environment, based on CachyOS.
Use the installer from the application menu to install to disk.
EOF
