#!/bin/bash

# 🪄 SPELLCASTER
MSG="$1"
LOG="$HOME/eternum/logs/whisper.log"
ENCODED=$(echo "$MSG" | base64)
HASHED=$(echo "$MSG" | shasum | cut -d' ' -f1)
TIMESTAMP=$(date +"%Y-%m-%d")

echo "$TIMESTAMP :: [spell] $MSG" >> "$LOG"
echo "$TIMESTAMP :: Encoded: $ENCODED"
echo "$TIMESTAMP :: Hash: $HASHED"
echo "📜 Spellcast complete. Whisper logged and encoded."
