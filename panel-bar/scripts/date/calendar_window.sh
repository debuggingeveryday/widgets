#!/bin/sh

showCalendar="$(eww --config $HOME/PROJECT/widgets/panel-bar get showCalendar)"

if [[ $showCalendar == true ]]; then
  eww --config $HOME/PROJECT/widgets/panel-bar open windowCalendar
  eww --config $HOME/PROJECT/widgets/panel-bar update showCalendar=false
else
  eww --config $HOME/PROJECT/widgets/panel-bar close windowCalendar
  eww --config $HOME/PROJECT/widgets/panel-bar update showCalendar=true
fi
