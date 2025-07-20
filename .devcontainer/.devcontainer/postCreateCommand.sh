#!/bin/bash

echo "⚙️  Initializing Eternum Ritual Chamber..."

mkdir -p ~/eternum/scripts
mkdir -p ~/eternum/logs

chmod +x ~/eternum/scripts/*.sh || true

echo "🌑 Whisper chamber prepared."

chmod +x .devcontainer/postCreateCommand.sh
