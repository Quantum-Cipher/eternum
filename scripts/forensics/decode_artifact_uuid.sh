#!/bin/bash

UUID="$1"
LOG_PATH=~/eternum/storage/iclog/forensic_logs/trace_$(date +%Y%m%d_%H%M%S)_$UUID.log
SEARCH_ROOT=~/Library

if [ -z "$UUID" ]; then
  echo "[!] Usage: ./decode_artifact_uuid.sh <UUID>"
  exit 1
fi

mkdir -p "$(dirname "$LOG_PATH")"
echo "🔍 Starting forensic UUID trace for: $UUID" | tee "$LOG_PATH"
echo "📅 Timestamp: $(date)" | tee -a "$LOG_PATH"
echo "📂 Scanning: $SEARCH_ROOT" | tee -a "$LOG_PATH"

# Spotlight search
echo -e "\n🌐 Spotlight matches:" | tee -a "$LOG_PATH"
mdfind "$UUID" 2>/dev/null | tee -a "$LOG_PATH"

# Deep grep scan
echo -e "\n📁 Deep grep matches:" | tee -a "$LOG_PATH"
find "$SEARCH_ROOT" -type f 2>/dev/null -exec grep -li "$UUID" {} + | tee -a "$LOG_PATH"

# Optional cloud bookmark match
echo -e "\n☁️ iCloud Bookmark traces:" | tee -a "$LOG_PATH"
find "$SEARCH_ROOT/Caches/CloudKit" -type f -name "*$UUID*" 2>/dev/null | tee -a "$LOG_PATH"

# Log completion
echo -e "\n✅ Forensic trace complete. Log saved to: $LOG_PATH"
