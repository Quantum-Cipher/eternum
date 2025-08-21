#!/bin/sh
set -eu
BASE="$HOME/Eternum/Security-Vault"
"$BASE/bin/ipqwery_guardian.py" "${1-}"
