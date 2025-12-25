#!/usr/bin/env bash

set -euo pipefail

echo "Removing GHC build artefacts..."

# Interface and object files
find ch* -type f \( -name '*.hi' -o -name '*.o' \) -print -delete

# Executables that correspond to source files (same path minus .hs)
while read -r src; do
  exe="${src%.hs}"
  if [ -f "$exe" ] || [ -x "$exe" ]; then
    echo "Removing $exe"
    rm -f "$exe"
  fi
done < <(find ch* -name '*.hs' -print)

echo "Clean complete."
