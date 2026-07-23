#!/usr/bin/env bash

OUT_DIR="$HOME/Videos"
mkdir -p "$OUT_DIR"
 
if pgrep -x gpu-screen-recorder > /dev/null; then
    pkill --signal SIGINT gpu-screen-recorder
    notify-send "Recording stopped" 2>/dev/null
else
    FILE="$OUT_DIR/game_$(date +%Y%m%d_%H%M%S).mp4"
    gpu-screen-recorder -w screen -f 60 -a default_output -o "$FILE" &
    disown
    notify-send "Recording started" "$FILE" 2>/dev/null
fi
