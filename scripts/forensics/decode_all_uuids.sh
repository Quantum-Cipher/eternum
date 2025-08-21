#!/bin/bash

UUID_FILE="$1"
SCRIPT_PATH=~/eternum/scripts/forensics/decode_artifact_uuid.sh

if [ ! -f "$UUID_FILE" ]; then
  echo "[!] Provide a file with UUIDs to decode. One per line."
  echo "Usage: ./decode_all_uuids.sh ~/eternum/uuid_list.txt"
  exit 1
fi

while IFS= read -r uuid; do
  echo "⏳ Decoding $uuid..."
  "$SCRIPT_PATH" "$uuid"
  echo ""
done < "$UUID_FILE"
