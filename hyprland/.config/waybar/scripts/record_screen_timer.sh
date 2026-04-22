#!/bin/bash

# If neither recording tool is running, output nothing and exit
if ! pidof gpu-screen-recorder >/dev/null && ! pidof pw-record >/dev/null; then
    exit 0
fi

START_FILE="$HOME/.config/waybar/.rec_start"

# If the process is running, calculate the duration
if [ -f "$START_FILE" ]; then
    START_TIME=$(cat "$START_FILE")
    CURRENT_TIME=$(date +%s)
    ELAPSED=$((CURRENT_TIME - START_TIME))
    
    # Calculate minutes and seconds
    MINUTES=$((ELAPSED / 60))
    SECONDS=$((ELAPSED % 60))
    
    # Format to always show two digits (e.g., 03:05)
    printf "🔴 %02d:%02d\n" "$MINUTES" "$SECONDS"
else
    # Fallback just in case the file doesn't exist yet
    echo "🔴 REC"
fi