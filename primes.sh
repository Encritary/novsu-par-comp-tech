#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: ./primes.sh <upper bound>"
  exit 1
fi

UPPER=$1

if [ $UPPER -lt 2 ]; then
  echo "Upper bound should be greater or equal to 2"
  exit 1
fi

SIEVE=()

SIEVE[0]=0
SIEVE[1]=0

for (( i = 2; i <= UPPER; i++ )); do
  SIEVE[i]=1
done

for (( i = 2; i * 2 <= UPPER; i++ )); do
  if [ ${SIEVE[i]} -eq 0 ]; then
    continue
  fi

  for (( j = 2; i * j <= UPPER; j++ )); do
    SIEVE[i*j]=0
  done
done

for (( i = 0; i <= UPPER; i++ )); do
  if [ ${SIEVE[i]} -eq 1 ]; then
    echo $i
  fi
done
