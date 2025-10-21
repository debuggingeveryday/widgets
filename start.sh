#!/bin/sh

killall eww
# eww daemon

CONFIG=$PWD/panel-bar

eww --config $CONFIG kill
eww --config $CONFIG close-all

eww --config $CONFIG daemon

# selected=$(eww --config $CONFIG list-windows | fzf)
selected="solid-bar"

sleep 1 && eww --config $CONFIG open $selected
tail -F $HOME/.cache/eww/eww_aa136499f8fe3706.log
