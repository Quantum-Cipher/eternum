#!/bin/zsh

LOG_FILE="$HOME/eternum/ghostnode_engine/logs/sentinel_surveillance.log"

echo "📡 SENTINEL WATCHER — $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"

# Record system info
echo "🧠 Hostname: $(hostname)" >> "$LOG_FILE"
echo "🕸️ IP: $(ipconfig getifaddr en0)" >> "$LOG_FILE"
echo "🔋 Battery: $(pmset -g batt | grep -Eo '[0-9]+%')" >> "$LOG_FILE"
echo "🌐 Network SSID: $(networksetup -getairportnetwork en0 | cut -d ':' -f2 | xargs)" >> "$LOG_FILE"
echo "💽 Disk Usage: $(df -h / | tail -1 | awk '{print $5}')" >> "$LOG_FILE"

# Record active processes (top 5 CPU)
echo "⚙️ Top Processes:" >> "$LOG_FILE"
ps -Ao pid,command,%cpu --sort=-%cpu | head -n 6 >> "$LOG_FILE"

# Echo JSON-friendly log block (for Firebase use later)
echo "{\"timestamp\":\"$(date '+%Y-%m-%dT%H:%M:%S')\",\"ip\":\"$(ipconfig getifaddr en0)\",\"disk\":\"$(df -h / | tail -1 | awk '{print $5}')\"}" >> "$LOG_FILE"

echo "---" >> "$LOG_FILE"
