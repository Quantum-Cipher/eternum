#!/bin/bash

echo "🔐 EternumShell: Verify TOTP Code"
read -sp "Enter passphrase to decrypt your secret: " passphrase
echo

enc_file="$HOME/.eternum_keys/totp_secret.enc"
tmp_file="$HOME/.eternum_keys/decrypted_secret.txt"

openssl enc -aes-256-cbc -d -pbkdf2 -in "$enc_file" -out "$tmp_file" -pass pass:"$passphrase" 2>/dev/null

if [[ ! -s "$tmp_file" ]]; then
  echo "❌ Decryption failed. Wrong password?"
  exit 1
fi

secret=$(cat "$tmp_file")
shred -u "$tmp_file"

read -p "Enter 6-digit TOTP code: " input_code

# Calculate current TOTP
now=$(date +%s)
counter=$((now / 30))

# Convert secret to binary key
key=$(echo -n "$secret" | base32 -d 2>/dev/null)

# HMAC + truncate
code=$(printf '%016x' $counter | xxd -r -p | openssl dgst -sha1 -mac HMAC -macopt key:$key -binary | xxd -p | tail -c 8)
offset=$(printf "0x%s" "${code:13:1}")
binary=$(printf "%d" $((0x${code:offset*2:8} & 0x7fffffff)))
generated_code=$(printf "%06d" $((binary % 1000000)))

if [[ "$input_code" == "$generated_code" ]]; then
  echo "✅ Code verified!"
else
  echo "❌ Invalid code."
fi
