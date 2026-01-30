#!/bin/sh
# Lock the screen
gtklock &
LOCKPID=$!

# Small delay to let gtklock grab input
sleep 0.3

# Turn off displays via niri
niri msg action power-off-monitors

# Wait until unlock
wait $LOCKPID

# Ensure outputs are back on (optional fallback)
niri msg action power-on-monitors
