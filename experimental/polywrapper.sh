#!/usr/bin/env sh

# Terminate already running bar instances
#killall -q polybar
killall -9 polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar example &
  #notify-send "Alert" "Using as primary $m"
else
  primary=$(xrandr --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    if [[ $primary == $m ]]; then
        MONITOR=$m TRAY_POS=right polybar example &
        notify-send "Alert" "Using as primary $m"
    else
        MONITOR=$m TRAY_POS=none polybar secondary &
        notify-send "Alert" "Using as secondary $m"
    fi
  done
fi

(sleep 1s; polybar-msg action "#discharge.module_toggle" && polybar-msg action "#memory.module_toggle" && polybar-msg action "#cpu.module_toggle" && polybar-msg action "#temperature.module_toggle")
