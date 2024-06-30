#!/bin/sh

declare -a showTrack=$(eww --config ~/Desktop/widgets/panel-bar get showTrack)

if [[ $showTrack == true ]]; then
  eww --config ~/Desktop/widgets/panel-bar close trackInfo
  eww --config ~/Desktop/widgets/panel-bar update showTrack=false
else
  eww --config ~/Desktop/widgets/panel-bar open trackInfo
  eww --config ~/Desktop/widgets/panel-bar update showTrack=true
fi
