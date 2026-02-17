#!/bin/bash
# toggle-center.sh

CONFIG="$HOME/.config/niri/config.kdl"

if grep -q 'center-focused-column "always"' "$CONFIG"; then
    sed -i 's/center-focused-column "always"/center-focused-column "never"/' "$CONFIG"
else
    sed -i 's/center-focused-column "never"/center-focused-column "always"/' "$CONFIG"
fi
