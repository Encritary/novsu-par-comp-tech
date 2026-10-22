#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 N" >&2
    exit 1
fi

n=$1

for ((i = 0; i < n; ++i)); do
    value=$(cat counter.txt)
    # другой процесс мог прочитать то же число
    value=$((value + 1))
    echo "$value" > counter.txt
done
