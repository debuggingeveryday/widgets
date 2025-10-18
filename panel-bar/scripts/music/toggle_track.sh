#!/bin/sh

declare -a showTrack=$(eww --config $HOME/PROJECT/widgets/panel-bar get showTrack)

if [[ $showTrack == true ]]; then
  eww --config $HOME/PROJECT/widgets/panel-bar close trackInfo
  eww --config $HOME/PROJECT/widgets/panel-bar update showTrack=false
else
  eww --config $HOME/PROJECT/widgets/panel-bar open trackInfo
  eww --config $HOME/PROJECT/widgets/panel-bar update showTrack=true
fi
