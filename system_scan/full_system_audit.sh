#!/bin/bash

LOGFILE="$HOME/eternum/system_scan/full_audit_report.log"
echo "🧠 ETERNUM SYSTEM AUDIT — $(date)" > "$LOGFILE"
echo "-------------------------------------" >> "$LOGFILE"

# Active Processes
echo "🟡 ACTIVE PROCESSES:" >> "$LOGFILE"
ps aux >> "$LOGFILE"

# Open Ports
echo -e "\n🟣 OPEN NETWORK PORTS:" >> "$LOGFILE"
lsof -i -nP | grep LISTEN >> "$LOGFILE"

# DNS Config
echo -e "\n🔵 DNS SETTINGS:" >> "$LOGFILE"
scutil --dns >> "$LOGFILE"

# Hosts File
echo -e "\n⚪️ HOSTS FILE CONTENT:" >> "$LOGFILE"
cat /etc/hosts >> "$LOGFILE"

# Startup Items
echo -e "\n🟠 LOGIN ITEMS & DAEMONS:" >> "$LOGFILE"
ls ~/Library/LaunchAgents >> "$LOGFILE"
ls /Library/LaunchAgents >> "$LOGFILE"
ls /Library/LaunchDaemons >> "$LOGFILE"

# Shell Aliases & Env
echo -e "\n🟤 SHELL ENVIRONMENT & ALIASES:" >> "$LOGFILE"
alias >> "$LOGFILE"
env >> "$LOGFILE"

# Crontab Check
echo -e "\n🔴 CRONTAB JOBS:" >> "$LOGFILE"
crontab -l >> "$LOGFILE" 2>/dev/null

# Hidden .apps or suspicious CLI binaries
echo -e "\n⚫️ HIDDEN APPS & SHELL BINDINGS:" >> "$LOGFILE"
find ~/ -name ".*.app" -or -name ".DS_Store" -or -name "*.command" >> "$LOGFILE"

# Recent Connections
echo -e "\n🧿 RECENT OUTBOUND CONNECTIONS:" >> "$LOGFILE"
netstat -an | grep ESTABLISHED >> "$LOGFILE"

# Metamask extensions
echo -e "\n🌐 BROWSER EXTENSIONS:" >> "$LOGFILE"
find ~/Library/Application\ Support/Google/Chrome/Default/Extensions -type d -depth 1 >> "$LOGFILE" 2>/dev/null

echo -e "\n✅ AUDIT COMPLETE — $(date)" >> "$LOGFILE"
