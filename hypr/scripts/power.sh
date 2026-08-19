#!/usr/bin/env bash

# 1. Define your available modes in cycle order
MODES=("quiet" "balanced" "performance")

# 2. File to store the current mode index
STATE_FILE="/tmp/power_mode"

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
omen power "$CURRENT_MODE"

# Save the new index for the next execution
echo "$NEXT_INDEX" > "$STATE_FILE"

# Optional: send a desktop notification
notify-send "Power Mode" "$CURRENT_MODE" -i bolt-color  -t 1000

