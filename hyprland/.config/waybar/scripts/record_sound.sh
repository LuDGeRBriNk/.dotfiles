#!/bin/bash

PID_FILE="/tmp/recording_sound.pid"
TEMP_FILE="/tmp/temp_audio.mp3"
START_TIME_FILE="/tmp/recording_sound_time"
FINAL_DIR="$HOME/screenshots"

mkdir -p "$FINAL_DIR"

case "$1" in
    mic)
        if [ -f "$PID_FILE" ]; then exit 0; fi
        date +%s > "$START_TIME_FILE"
        ffmpeg -y -f pulse -i default -c:a libmp3lame -q:a 2 "$TEMP_FILE" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        ;;
    sys)
        if [ -f "$PID_FILE" ]; then exit 0; fi
        date +%s > "$START_TIME_FILE"
        SINK_MONITOR=$(pactl get-default-sink).monitor
        ffmpeg -y -f pulse -i "$SINK_MONITOR" -c:a libmp3lame -q:a 2 "$TEMP_FILE" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        ;;
    both)
        if [ -f "$PID_FILE" ]; then exit 0; fi
        date +%s > "$START_TIME_FILE"
        SINK_MONITOR=$(pactl get-default-sink).monitor
        ffmpeg -y -f pulse -i default -f pulse -i "$SINK_MONITOR" -filter_complex amix=inputs=2:duration=longest -c:a libmp3lame -q:a 2 "$TEMP_FILE" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        ;;
    stop)
        if [ -f "$PID_FILE" ]; then
            PID=$(cat "$PID_FILE")
            kill -2 "$PID" 
            rm -f "$PID_FILE"
            rm -f "$START_TIME_FILE"
            
            while is=$(ps -p "$PID" -o pid=); do sleep 0.5; done
            
            # Create a temporary GTK configuration to scale all fonts globally
            TMP_CONF=$(mktemp -d)
            mkdir -p "$TMP_CONF/gtk-4.0" "$TMP_CONF/gtk-3.0"
            
            # The default system font is usually 10pt. 16pt is exactly a 1.6x scale factor.
            # Using an absolute unit (pt) prevents compounding on nested elements.
            echo "* { font-size: 16pt; }" > "$TMP_CONF/gtk-4.0/gtk.css"
            echo "* { font-size: 16pt; }" > "$TMP_CONF/gtk-3.0/gtk.css"
            
            # Wait for user to decide via a GTK popup
            # We temporarily hijack XDG_CONFIG_HOME so Zenity reads our scaled CSS file
            CHOICE=$(XDG_CONFIG_HOME="$TMP_CONF" GTK_THEME="Adwaita-dark" ADW_DEBUG_COLOR_SCHEME=prefer-dark zenity --list \
                --title="Recording Finished" \
                --text="Audio recording stopped. What would you like to do?" \
                --column="Options" \
                "Save audio" \
                "Discard audio" \
                --hide-header \
                --width=560 --height=352)
                
            # Clean up the temporary CSS files instantly
            rm -rf "$TMP_CONF"

            # Process the choice and send a system notification
            case "$CHOICE" in
                "Save audio")
                    FILENAME="Audio_$(date +%Y%m%d_%H%M%S).mp3"
                    mv "$TEMP_FILE" "$FINAL_DIR/$FILENAME"
                    notify-send "Audio Saved" "Saved as $FILENAME to screenshots folder." -i audio-x-generic
                    ;;
                *)
                    # Catch-all for "Discard audio" or if the user simply closes the window
                    rm -f "$TEMP_FILE"
                    notify-send "Audio Discarded" "The temporary audio file was deleted." -i user-trash
                    ;;
            esac
        fi
        ;;
esac