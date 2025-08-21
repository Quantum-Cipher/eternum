#!/bin/sh
# Eternum SSH auto bootstrap — loads key & keychain safely each session

SSH_DIR="$HOME/.ssh"
KEY="$SSH_DIR/id_ed25519"

# Ensure .ssh exists with safe perms
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Start or connect to an ssh-agent
eval "$(ssh-agent -s)" >/dev/null

# Prefer Apple keychain on macOS (falls back to normal ssh-add if not available)
if [ -f "$KEY" ]; then
  if command -v /usr/bin/ssh-add >/dev/null 2>&1; then
    /usr/bin/ssh-add --apple-use-keychain "$KEY" >/dev/null 2>&1 || /usr/bin/ssh-add "$KEY"
  else
    ssh-add "$KEY"
  fi
fi

# Tighten key/file perms if present
[ -f "$KEY" ] && chmod 600 "$KEY"
[ -f "$KEY.pub" ] && chmod 644 "$KEY.pub"

exit 0
