#!/bin/sh

type=$1
network_stat=$(vnstat -i wlan0 -tr 2)

if [[ "$type" == "up" ]]; then
  echo $network_stat | awk '{print $21 " kbs"}'
elif [[ "$type" == "down" ]]; then
  echo $network_stat | awk '{print $16 " kbs"}'
fi
