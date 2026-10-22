#!/usr/bin/env bash

if [[ $# -lt 2 || $# -gt 3 ]]; then
    echo "Usage: $0 N M [plain|lock]" >&2
    exit 1
fi

n=$1
m=$2
mode=$3

script=./script_a.sh
if [[ $mode == lock ]]; then
    script=./script_a_lock.sh
fi

# сначала обнуляем счётчик
echo 0 > counter.txt
for ((i = 0; i < m; ++i)); do
    "$script" "$n" &
done
wait  # ждём все запущенные процессы

echo "a = $(cat counter.txt)"
echo "expected = $((n * m))"
