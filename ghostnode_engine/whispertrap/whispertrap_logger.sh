#!/bin/zsh

WHISPER_LOG="$HOME/eternum/ghostnode_engine/logs/whispertrap.log"

echo "🔍 WhisperTrap Listening — $(date '+%Y-%m-%d %H:%M:%S')" >> "$WHISPER_LOG"

# Log current command history
echo "🧠 Recent Commands:" >> "$WHISPER_LOG"
tail -n 5 "$HOME/.zsh_history" | sed 's/^:.*;//' >> "$WHISPER_LOG"

# (Optional) Log current GPT exchange manually for now
if [ -f "$HOME/eternum/ghostnode_engine/whispertrap/ai_response.tmp" ]; then
  echo "🤖 AI Response:" >> "$WHISPER_LOG"
  cat "$HOME/eternum/ghostnode_engine/whispertrap/ai_response.tmp" >> "$WHISPER_LOG"
  rm "$HOME/eternum/ghostnode_engine/whispertrap/ai_response.tmp"
else
  echo "🤖 No new AI response captured." >> "$WHISPER_LOG"
fi

echo "---" >> "$WHISPER_LOG"
