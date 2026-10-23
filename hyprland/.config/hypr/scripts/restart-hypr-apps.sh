#!/usr/bin/env bash

# 1. Define your list of programs here. 
# Just add new names inside the parentheses separated by spaces.
PROGRAMS=("waybar" "hyprpaper" "hypridle")

# Array to keep track of successfully started programs
SUCCESSFUL_APPS=()

# 2. Kill all programs in the list first
for prog in "${PROGRAMS[@]}"; do
    killall -q "$prog"
done

# Wait a fraction of a second to ensure ports and processes are fully released
sleep 0.2

# 2.optional Reload Hyprland
if [[ "$1" == "reload" ]]; then
    hyprctl reload
    notify-send -u normal "✅ Hyprland" "Configuration reloaded successfully"
    sleep 0.2
fi

# 3. Restart and verify each program individually

for prog in "${PROGRAMS[@]}"; do
    # Define a temporary log file for this specific program
    ERROR_LOG="/tmp/${prog}_error.log"
    
    # Start the program in the background. 
    # Standard output is hidden, but error output is saved to the log file.
    "$prog" > /dev/null 2> "$ERROR_LOG" &
    
    # Wait briefly to catch immediate crashes (e.g., bad config files)
    sleep 0.2
    
    # Check if the process is actually running using pgrep
    if pgrep -x "$prog" > /dev/null; then
        # Add the successful program to our array instead of notifying immediately
        SUCCESSFUL_APPS+=("$prog")
    else
        # If it crashed, grab the first 4 lines of the error log
        ERROR_MSG=$(head -n 4 "$ERROR_LOG")
        
        # Provide a fallback message if it crashed without leaving a log
        if [[ -z "$ERROR_MSG" ]]; then
            ERROR_MSG="Process crashed silently."
        fi
        
        # Send a critical notification with the exact error
        notify-send -u critical "❌ UI Reset: $prog Failed" "$ERROR_MSG"
    fi
done

# 4. Send a single notification for all successful programs
if [ ${#SUCCESSFUL_APPS[@]} -gt 0 ]; then
    # Join the array elements with a comma and space for readability
    SUCCESS_MSG=$(IFS=', '; echo "${SUCCESSFUL_APPS[*]}")
    notify-send -u normal "✅ UI Reset: Success" "Started successfully: $SUCCESS_MSG"
fi

# Run wallpaper.sh in the same folder:
"$HOME/.config/hypr/scripts/set-wallpaper.sh"