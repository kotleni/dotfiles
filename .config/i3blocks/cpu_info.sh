#!/usr/bin/env bash

TEMP=$(sensors 2>/dev/null | awk '/(Tctl|Tdie|Package id 0):/ {print $2; exit}')
CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%.2f", 100 - $NF)}')

echo "$CPU_USAGE $TEMP" | awk '{ printf(" CPU:%6s%% @ %s \n", $1, $2) }'
