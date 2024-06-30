#!/bin/sh

showCalendar="$(eww --config ~/Desktop/widgets/panel-bar get showCalendar)"

if [[ $showCalendar == true ]]; then
 eww --config ~/Desktop/widgets/panel-bar open windowCalendar
 eww --config ~/Desktop/widgets/panel-bar update showCalendar=false
else
 eww --config ~/Desktop/widgets/panel-bar close windowCalendar
 eww --config ~/Desktop/widgets/panel-bar update showCalendar=true
fi
