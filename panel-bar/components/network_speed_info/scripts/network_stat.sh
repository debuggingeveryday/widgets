#!/bin/sh

type=$1
network_stat=$(vnstat -i enp4s0 -tr 2)

if [[ "$type" == "up" ]]; then
  echo $network_stat | awk '{print $21 "-" $23}'
elif [[ "$type" == "down" ]]; then
  echo $network_stat | awk '{print $16 "-" $18}'
fi
