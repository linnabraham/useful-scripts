#!/bin/bash

# Replace 'gtk_application_command' with the actual command to launch your GTK application.
gtk_application_command="$@"

# Check if the application is already running
if wmctrl -lx | grep -q "Gtk"; then
    wmctrl -a "Gtk" || wmctrl -a "GTK"
else
    # Launch the GTK application
    $gtk_application_command &
fi
