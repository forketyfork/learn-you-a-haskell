#!/usr/bin/env bash

set -euo pipefail

echo "Typechecking Haskell files with module dependencies..."

includes=(-i.)
for dir in ch*; do
  [ -d "$dir" ] && includes+=("-i$dir")
done

mapfile -t hs_files < <(find ch* -name "*.hs" -print | sort)

echo "Include paths: ${includes[*]}"
echo "Files to check: ${#hs_files[@]}"

ghc --make -fno-code -Wall -fno-warn-unused-imports -fno-warn-unused-matches \
  "${includes[@]}" "${hs_files[@]}"

echo "All files typechecked successfully."
