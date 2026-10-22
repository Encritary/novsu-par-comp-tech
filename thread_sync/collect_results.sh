#!/usr/bin/env bash

set -e

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 macos|linux" >&2
    exit 1
fi

platform=$1

mkdir -p "results/$platform"
python3 run_experiments.py scripts > "results/$platform/scripts.csv"

for opt in O0 O2; do
    python3 run_experiments.py "race_$opt" > "results/$platform/race_$opt.csv"
    python3 run_experiments.py "$opt" > "results/$platform/timing_$opt.csv"
done
