#!/bin/zsh

BEACON_LOG="$HOME/eternum/ghostnode_engine/logs/eternal_beacon.log"
SIGIL="$HOME/eternum/ghostnode_engine/logs/sigil_reports.log"
SENTINEL="$HOME/eternum/ghostnode_engine/logs/sentinel_surveillance.log"
WHISPER="$HOME/eternum/ghostnode_engine/logs/whispertrap.log"

echo "🌐 ETERNAL BEACON :: $(date '+%Y-%m-%d %H:%M:%S')" >> "$BEACON_LOG"
echo "-------------------------" >> "$BEACON_LOG"

# Merge last pulses from each system log
echo "📡 [GHOSTNODE DAEMON]" >> "$BEACON_LOG"
tail -n 10 "$SIGIL" >> "$BEACON_LOG"
echo "---" >> "$BEACON_LOG"

echo "🛡️ [SENTINEL SURVEILLANCE]" >> "$BEACON_LOG"
tail -n 10 "$SENTINEL" >> "$BEACON_LOG"
echo "---" >> "$BEACON_LOG"

echo "🗣️ [WHISPERTRAP]" >> "$BEACON_LOG"
tail -n 10 "$WHISPER" >> "$BEACON_LOG"
echo "--- END PULSE ---" >> "$BEACON_LOG"
echo "" >> "$BEACON_LOG"
