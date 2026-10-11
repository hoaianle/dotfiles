#!/usr/bin/env bash

online=$(cat /sys/class/power_supply/AC/online)
current_profile=$(powerprofilesctl get)

if [[ "$online" == 1 && "$current_profile" != "performance" ]]; then
    powerprofilesctl set performance
elif [[ "$online" == 0 && "$current_profile" != "balanced" ]]; then
    powerprofilesctl set balanced
fi
