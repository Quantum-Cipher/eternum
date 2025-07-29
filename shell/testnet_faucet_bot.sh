#!/bin/bash
ADDRESS="0x589C0526B1bff47BF254F55E9E8384980AB430B5"
LOG_FILE="$HOME/eternum/signal_pings/faucet_response.log"

while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') — Requesting faucet ETH..." >> $LOG_FILE
  curl -s -X POST https://faucet.zora.energy/fund     -H "Content-Type: application/json"     -d "{\"address\": \"$ADDRESS\"}" >> $LOG_FILE 2>&1
  echo "----" >> $LOG_FILE
  sleep 600
done
