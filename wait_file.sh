#!/bin/bash

set -euo pipefail

FILE="/tmp/ready"
MAX_TIME=30
INTERVAL=2

count=0

while [ "$count" -lt "$MAX_TIME" ]; do
    if [ -e "$FILE" ]; then
        echo "Файл $FILE появился (ждали ${count}s)"
        exit 0
    fi

    sleep "$INTERVAL"
    count=$((count + INTERVAL))
done

if [ -e "$FILE" ]; then
    echo "Файл $FILE появился (ждали ${count})"
    exit 0
fi

echo "Таймаут: файл $FILE не появился" >&2
exit 1
