#!/bin/bash

START_TIME_FILE="/tmp/recording_sound_time"

if [ -f "$START_TIME_FILE" ]; then
    START_TIME=$(cat "$START_TIME_FILE")
    CURRENT_TIME=$(date +%s)
    ELAPSED=$((CURRENT_TIME - START_TIME))
    
    MINUTES=$((ELAPSED / 60))
    SECONDS=$((ELAPSED % 60))
    
    printf "<span foreground='red'></span> %02d:%02d\n" "$MINUTES" "$SECONDS"
else
    echo ""
fi