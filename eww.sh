#!/bin/sh

# killall eww
# eww daemon

CONFIG=./panel-bar

eww --config $CONFIG kill
eww --config $CONFIG close-all

eww --config $CONFIG daemon

selected=$(eww --config $CONFIG list-windows | fzf)

sleep 2 && eww --config $CONFIG open $selected
