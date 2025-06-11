#!/bin/sh

showCalendar="$(eww --config ~/RANDOM/widgets/panel-bar get showCalendar)"

if [[ $showCalendar == true ]]; then
  eww --config ~/RANDOM/widgets/panel-bar open windowCalendar
  eww --config ~/RANDOM/widgets/panel-bar update showCalendar=false
else
  eww --config ~/RANDOM/widgets/panel-bar close windowCalendar
  eww --config ~/RANDOM/widgets/panel-bar update showCalendar=true
fi
