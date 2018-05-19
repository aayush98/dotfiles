#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# using "polybar bar1 & bar2"
# but only one bar?: "polybar topbar"
polybar topbar


echo "Bars launched..."
