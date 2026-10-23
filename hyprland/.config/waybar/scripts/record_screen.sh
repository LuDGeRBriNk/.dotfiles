#!/bin/bash

# 1. Handle stopping the recording cleanly
if [ "$1" == "stop" ]; then
    pkill -SIGINT -f gpu-screen-recorder
    pkill -SIGINT -f pw-record
    exit 0
fi

TIMESTAMP=$(date +%s)
TEMP_FILE="/tmp/rec_${TIMESTAMP}.mp4"
FINAL_DIR="$HOME/screenshots"
START_FILE="$HOME/.config/waybar/.rec_start"

# Save the start time for the Waybar timer module
echo "$TIMESTAMP" > "$START_FILE"

# Ask Hyprland for all monitors, find the one with 'eDP', and grab its exact name
CURRENT_MONITOR=$(hyprctl monitors | awk '/Monitor eDP/ {print $2}')

# Fallback just in case nothing is found
if [ -z "$CURRENT_MONITOR" ]; then
    CURRENT_MONITOR="eDP-1"
fi

handle_recording() {
    # 1. Start recording in the foreground of this background subshell
    "$@" -c mp4 -f 60 -a "default_output|default_input" -o "$TEMP_FILE"
    
    # 2. Create a temporary GTK configuration to scale all fonts globally
    TMP_CONF=$(mktemp -d)
    mkdir -p "$TMP_CONF/gtk-4.0" "$TMP_CONF/gtk-3.0"
    
    # The default system font is usually 10pt. 16pt is exactly a 1.6x scale factor.
    # Using an absolute unit (pt) prevents compounding on nested elements.
    echo "* { font-size: 16pt; }" > "$TMP_CONF/gtk-4.0/gtk.css"
    echo "* { font-size: 16pt; }" > "$TMP_CONF/gtk-3.0/gtk.css"
    
    # 3. Wait for user to decide via a GTK popup
    # We temporarily hijack XDG_CONFIG_HOME so Zenity reads our scaled CSS file
    CHOICE=$(XDG_CONFIG_HOME="$TMP_CONF" GTK_THEME="Adwaita-dark" ADW_DEBUG_COLOR_SCHEME=prefer-dark zenity --list \
        --title="Recording Finished" \
        --text="Recording stopped. What would you like to do?" \
        --column="Options" \
        "Save with audio" \
        "Save without audio" \
        "Discard video" \
        --hide-header \
        --width=560 --height=352)
        
    # 4. Clean up the temporary CSS files instantly
    rm -rf "$TMP_CONF"
        
    # 5. Process the choice and send a system notification
    case "$CHOICE" in
        "Save with audio")
            mv "$TEMP_FILE" "$FINAL_DIR/rec_${TIMESTAMP}.mp4"
            notify-send "Recording Saved" "Video saved with audio to screenshots folder." -i video-x-generic
            ;;
        "Save without audio")
            notify-send "Processing" "Removing audio track..." -i video-x-generic
            # -c copy prevents video re-encoding, -an drops the audio track entirely
            ffmpeg -i "$TEMP_FILE" -c copy -an "$FINAL_DIR/rec_${TIMESTAMP}_muted.mp4" -y
            rm -f "$TEMP_FILE"
            notify-send "Recording Saved" "Muted video saved to screenshots folder." -i video-x-generic
            ;;
        *)
            # Catch-all for "Discard video" or if the user simply closes the window
            rm -f "$TEMP_FILE"
            notify-send "Recording Discarded" "The temporary video file was deleted." -i user-trash
            ;;
    esac
}

# The wrapper function is called in the background (&) so Waybar isn't frozen
if [ "$1" == "full" ]; then
    handle_recording gpu-screen-recorder -w "$CURRENT_MONITOR" &
elif [ "$1" == "select" ]; then
    TARGET_MONITOR=$(slurp -o -f "%o")
    if [ -z "$TARGET_MONITOR" ]; then exit 0; fi
    handle_recording gpu-screen-recorder -w "$TARGET_MONITOR" &
elif [ "$1" == "region" ]; then
    REGION=$(slurp -f '%wx%h+%x+%y')
    if [ -z "$REGION" ]; then exit 0; fi
    handle_recording gpu-screen-recorder -w region -region "$REGION" &
elif [ "$1" == "voice" ]; then
    pw-record ~/Music/voice_rec_${TIMESTAMP}.wav &
fi