#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 N" >&2
    exit 1
fi

n=$1

for ((i = 0; i < n; ++i)); do
    (
        flock -x 200
        # читаем и записываем файл под одной блокировкой
        value=$(cat counter.txt)
        value=$((value + 1))
        echo "$value" > counter.txt
    ) 200>counter.lock
done
