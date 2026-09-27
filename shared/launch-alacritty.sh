#!/usr/bin/env bash

# --- THE "FOCUS FIXER" FOR ALACRITTY ---
# Cinnamon (Muffin) has this weird bug where it won't focus Alacritty windows on launch.
# It’s basically a fight between the 'winit' library and the window manager(muffin).
# This script is the peace treaty until someone fixes the upstream bug.

alacritty &
pid=$!

while ! window_id=$(xdotool search --pid "$pid" 2>/dev/null); do
    :
done

wmctrl -i -R "${window_id%%$'\n'*}"
