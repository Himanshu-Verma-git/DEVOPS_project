#!/bin/bash

THRESHOLD=15

df -h | awk 'NR>1 {print $1, $5, $6}' | while read filesystem usage mountpoint; do
  usage_percent=$(echo "$usage" | sed 's/%//')
  
  if [ "$usage_percent" -gt "$THRESHOLD" ]; then
    exit 2
  fi  
done
