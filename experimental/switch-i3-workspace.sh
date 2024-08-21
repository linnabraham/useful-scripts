#!/bin/env bash
# Switch to a new workspace automatically without first specifying the number
# Avoids certain workspaces which are reserved

i3-msg workspace $(
    next_ws=$((
        $(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | grep -v '^10$' | grep -v '^9$' | grep -v '^8$'| sort -rn | head -1) + 1
    ))
    if [ "$next_ws" -eq 10 ] || [ "$next_ws" -eq 9 ] || [ "$next_ws" -eq 8 ] ; then
        next_ws=11
    fi
    echo $next_ws
)
