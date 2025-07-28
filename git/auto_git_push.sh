#!/bin/zsh

cd ~/eternum

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
git add .
git commit -m "🌐 Auto-push at $TIMESTAMP"
git push origin main
