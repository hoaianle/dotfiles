#!/usr/bin/env bash

online=$(cat /sys/class/power_supply/AC/online)
current_profile=$(powerprofilectl get)

if [[ "$online" == 1 && "$current_profile" != "performance" ]]; then
    powerprofilectl set performance
elif [[ "$online" == 0 && "$current_profile" != "balanced" ]]; then
    powerprofilectl set balanced
fi
