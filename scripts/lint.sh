#!/usr/bin/env bash

set -euo pipefail

mapfile -t hs_files < <(find ch* -name "*.hs" -print | sort)

echo "Running hlint..."
hlint "${hs_files[@]}"

echo "Checking formatting with ormolu..."
ormolu --mode check "${hs_files[@]}"

echo "Lint and format checks passed."
