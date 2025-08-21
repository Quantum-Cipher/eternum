#!/bin/bash

cd ~/eternum/agents/alignment_daemon || exit 1

# Unignore veil_signature.log for this commit only
echo "🌐 Eternal veil pulse: $(date '+%Y-%m-%d')" >> veil_signature.log
git add -f veil_signature.log

# Sign and push
git commit -S -m "🔐 Auto-signed veil sigil: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
