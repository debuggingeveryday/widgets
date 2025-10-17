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
# tail -F /home/scrubs/.cache/eww/eww_aa136499f8fe3706.log
