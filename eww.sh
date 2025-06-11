#!/bin/sh

killall eww
# eww daemon

CONFIG=./panel-bar

eww --config $CONFIG kill
eww --config $CONFIG close-all

eww --config $CONFIG daemon

# selected=$(eww --config $CONFIG list-windows | fzf)
selected="bar"

sleep 1 && eww --config $CONFIG open $selected
tail -F /home/scrubs/.cache/eww/eww_d07470f30e956586.log
