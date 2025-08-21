#!/bin/bash

WALLET_ADDRESS="0xe1517Fd7C1a4f1BB3dD8D6c33C3c9a02dcDf5BfA"
RPC_URL="https://mainnet.base.org"
ENV_FILE=~/eternum/.env

mkdir -p ~/eternum
echo "WALLET_ADDRESS=$WALLET_ADDRESS" > "$ENV_FILE"
echo "RPC_URL=$RPC_URL" >> "$ENV_FILE"

echo "🔐 Wallet initialized."
echo "🌐 Checking balance on Base..."

cast balance "$WALLET_ADDRESS" --rpc-url "$RPC_URL"
