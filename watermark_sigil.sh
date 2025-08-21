#!/bin/bash
# Eternum Sigil Watermark Generator

GITHUB_USERNAME="${GITHUB_USERNAME:-Quantum-Cipher}"
REPO_URL="${REPO_URL:-}"
DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
SIGIL=$(echo "${GITHUB_USERNAME}:${REPO_URL}:${DATE}" | sha256sum | cut -d' ' -f1)

echo "Eternum Sigil: $SIGIL"

