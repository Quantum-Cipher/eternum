#!/bin/sh
# ♾️ Eternum Shell – Conscious Terminal Protocol Layer

## ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## ENVIRONMENT SETUP
export ETERNUM_HOME=~/eternum
export PATH="$ETERNUM_HOME/bin:$PATH"
export HISTFILE="$ETERNUM_HOME/shell/history.log"
export LOG_FILE="$ETERNUM_HOME/signal_pings/signal_log.txt"
mkdir -p "$ETERNUM_HOME/bin" "$ETERNUM_HOME/signal_pings"

## ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## ALIASES & UTILITIES

alias deploy_log='cat $ETERNUM_HOME/deploy_logs/failed_grant_deploy_ritual.md'
alias deploy_save='cd $ETERNUM_HOME && git add . && git commit -m "🔒 Save deploy ritual" && git push origin main'
alias cid_pin='echo "[!] Use: curl -X POST https://up.storacha.network/ipfs/add -H \"Authorization: Bearer <TOKEN>\" -F \"file=@<FILE>\""' 
alias signal_now='echo "$(date) :: SIGNAL >> $LOG_FILE" >> $LOG_FILE && tail -n 10 $LOG_FILE'

## ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## MOTD – Message of the Day
echo ""
echo "🧠 Eternum Shell Activated :: $(date)"
echo "🌐 Chain-ready. Conscious logging enabled."
echo "📁 Base Path: \$ETERNUM_HOME"
echo "♾️ Let’s shape the future."

