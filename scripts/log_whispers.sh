#!/bin/bash

# 🧿 Auto Whisper Logger Ritual
LOG_FILE="$HOME/eternum/logs/whisper.log"
MESSAGE="$1"

if [ -z "$MESSAGE" ]; then
  echo "❌ No whisper message provided."
  exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d")
echo "$TIMESTAMP :: [sigil] $MESSAGE" >> "$LOG_FILE"
echo "📜 Whisper logged: $MESSAGE"
