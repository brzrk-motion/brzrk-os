#!/usr/bin/env bash
set -euo pipefail

install -D -m 0644 /usr/share/brzrk/profile-user /etc/dconf/profile/user
dconf update

cat > /etc/motd <<'EOF'
BRZRK OS

Creative workstation live environment, based on CachyOS.
Use the installer from the application menu to install to disk.
EOF
