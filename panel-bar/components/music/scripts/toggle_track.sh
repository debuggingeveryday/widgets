#!/bin/sh

declare -a showTrack=$(eww --config ~/RANDOM/widgets/panel-bar get showTrack)

if [[ $showTrack == true ]]; then
  eww --config ~/RANDOM/widgets/panel-bar close trackInfo
  eww --config ~/RANDOM/widgets/panel-bar update showTrack=false
else
  eww --config ~/RANDOM/widgets/panel-bar open trackInfo
  eww --config ~/RANDOM/widgets/panel-bar update showTrack=true
fi
