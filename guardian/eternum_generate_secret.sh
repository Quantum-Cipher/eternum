#!/bin/bash

echo "♾️ EternumShell: Generate TOTP Secret"

# Prerequisites
which openssl >/dev/null || { echo "❌ openssl not found. Install openssl to continue."; exit 1; }
which base32 >/dev/null || { echo "❌ base32 not found. Install coreutils."; exit 1; }

# Step 1: Generate random 32-byte base32 secret
secret=$(openssl rand -base64 32 | base32 | tr -d '=' | head -c 32)
echo "🔑 Generated Base32 Secret: $secret"

# Step 2: Show QR-compatible URI
label="Quantum-Cipher@GitHub"
issuer="EternumGuardian"
otpauth="otpauth://totp/${label}?secret=${secret}&issuer=${issuer}"
echo -e "\n🌀 Pair this with your Authenticator App:"
echo "$otpauth"

# Step 3: Save encrypted secret
read -sp "🔐 Enter encryption passphrase: " passphrase
echo

mkdir -p ~/.eternum_keys
echo "$secret" > ~/.eternum_keys/totp_plain.txt
openssl enc -aes-256-cbc -salt -pbkdf2 -in ~/.eternum_keys/totp_plain.txt \
  -out ~/.eternum_keys/totp_secret.enc \
  -pass pass:"$passphrase"

shred -u ~/.eternum_keys/totp_plain.txt

echo "✅ Secret encrypted and stored at ~/.eternum_keys/totp_secret.enc"
