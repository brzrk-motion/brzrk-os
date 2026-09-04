#!/usr/bin/env bash
# BRZRK OS Starship activation for interactive Bash shells.
if command -v starship >/dev/null 2>&1 && [[ $- == *i* ]]; then
  eval "$(starship init bash)"
fi
