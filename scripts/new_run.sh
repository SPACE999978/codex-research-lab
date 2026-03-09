#!/bin/zsh
set -euo pipefail
TAG=${1:-$(date +%Y-%m-%d)}
echo "Creating research run: $TAG"
mkdir -p "runs/$TAG"
cp templates/results.tsv "runs/$TAG/results.tsv"
echo "Run scaffolded at runs/$TAG"
