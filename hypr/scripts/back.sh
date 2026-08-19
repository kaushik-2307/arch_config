#!/usr/bin/env bash

# 1. Define your available modes in cycle order
MODES=("static" "breathing" "rainbow" "wave" "chase")

# 2. File to store the current mode index
STATE_FILE="/tmp/kb_backlight_mode"

# Read the last index (defaults to -1 if state file doesn't exist)
LAST_INDEX=$(cat "$STATE_FILE" 2>/dev/null || echo "-1")

# Calculate the next index using modulo arithmetic to wrap around
NUM_MODES=${#MODES[@]}
NEXT_INDEX=$(( (LAST_INDEX + 1) % NUM_MODES ))

# Get the mode string
CURRENT_MODE="${MODES[$NEXT_INDEX]}"

# 3. Replace this command with your tool's actual syntax
# Example: openrgb --mode "$CURRENT_MODE"
# Example: asusctl led-mode "$CURRENT_MODE"
omen rgb "$CURRENT_MODE"

# Save the new index for the next execution
echo "$NEXT_INDEX" > "$STATE_FILE"

# Optional: send a desktop notification
notify-send "Keyboard Backlight" "$CURRENT_MODE" -i input-keyboard -t 1000
