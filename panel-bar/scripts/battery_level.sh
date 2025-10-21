#!/bin/bash
# Battery Level Script - Single Responsibility: Get battery percentage

# Get battery level
if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "${battery_level}%"
else
    echo "-"
fi
