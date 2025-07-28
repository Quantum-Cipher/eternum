#!/bin/zsh

DATE=$(date '+%Y-%m-%d')
LOG_DIR="$HOME/eternum/ghostnode_engine/logs"
ARCHIVE_DIR="$HOME/eternum/ghostnode_engine/archive"
ZIP_FILE="$ARCHIVE_DIR/logs_$DATE.zip"
GPG_FILE="$ARCHIVE_DIR/logs_$DATE.gpg"
PASSPHRASE="Eternum369Vault" # 🔐 You can rotate this as needed

# Step 1: Zip all logs
zip -j "$ZIP_FILE" $LOG_DIR/*.log

# Step 2: Encrypt the zip archive
gpg --batch --yes --passphrase "$PASSPHRASE" -c "$ZIP_FILE"

# Step 3: Clean up unencrypted zip
rm "$ZIP_FILE"

echo "🔐 Logs encrypted as: $GPG_FILE"
