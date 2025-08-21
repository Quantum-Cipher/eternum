#!/bin/bash

# 🧿 Eternum Whisper Search Ritual

LOG_FILE="$HOME/eternum/logs/whisper.log"

PHRASE=""
EXCLUDE=""
RANGE_DATE=""
TAGS=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --phrase) PHRASE="$2"; shift ;;
        --exclude) EXCLUDE="$2"; shift ;;
        --range-date) RANGE_DATE="$2"; shift ;;
        --tags) TAGS="$2"; shift ;;
    esac
    shift
done

CMD="cat \"$LOG_FILE\""

if [ ! -z "$PHRASE" ]; then
    CMD="$CMD | grep -F \"$PHRASE\""
fi

if [ ! -z "$EXCLUDE" ]; then
    CMD="$CMD | grep -v \"$EXCLUDE\""
fi

if [ ! -z "$TAGS" ]; then
    CMD="$CMD | grep -E \"$TAGS\""
fi

if [ ! -z "$RANGE_DATE" ]; then
    IFS='..' read -ra DATES <<< "$RANGE_DATE"
    CMD="$CMD | awk '\$1 >= \"${DATES[0]}\" && \$1 <= \"${DATES[1]}\"'"
fi

echo "🔍 Executing search ritual..."
eval $CMD
