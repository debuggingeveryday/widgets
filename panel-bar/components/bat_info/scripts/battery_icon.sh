#!/bin/sh

declare -rA battery_status="$(cat /sys/class/power_supply/BAT1/status)"
declare -rA battery_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"

declare -rA charging_battery_icon=(
  [0]="󰢟"
  [10]="󰢜"
  [20]="󰂆"
  [30]="󰂇"
  [40]="󰂈"
  [50]="󰢝"
  [60]="󰂉"
  [70]="󰢞"
  [80]="󰂊"
  [90]="󰂋"
  [100]="󰂅"
)

declare -rA discharging_battery_icon=(
  [0]="󰂎"
  [10]="󰁺"
  [20]="󰁻"
  [30]="󰁼"
  [40]="󰁽"
  [50]="󰁾"
  [60]="󰁿"
  [70]="󰂀"
  [80]="󰂁"
  [90]="󰂂"
  [100]="󰁹"
)


label_template() {
  local label=""
  for key in ${!discharging_battery_icon[@]}; do
    label="${discharging_battery_icon[$key]}"
  done

  echo $label
}

label_template "$battery_status" "$battery_capacity" 
