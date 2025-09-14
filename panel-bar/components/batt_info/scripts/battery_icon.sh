#!/bin/sh

[[ ! -d "/sys/class/power_supply/BAT1" ]] && echo "no-module-battery" && exit 0

declare -i low_battery_value=30
declare -rA battery_status="$(cat /sys/class/power_supply/BAT1/status)"
declare -rA battery_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"

declare -ra charging_battery_icon=(
  "󰢟"
  "󰢜"
  "󰂆"
  "󰂇"
  "󰂈"
  "󰢝"
  "󰂉"
  "󰢞"
  "󰂊"
  "󰂋"
  "󰂅"
)

declare -ra discharging_battery_icon=(
  "󰂎"
  "󰁺"
  "󰁻"
  "󰁼"
  "󰁽"
  "󰁾"
  "󰁿"
  "󰂀"
  "󰂁"
  "󰂂"
  "󰁹"
)

declare -r type="$1"

label_template() {
  local icon=""
  local -r status="$1"
  local -r capacity=$(($2))
  local -a battery_style=()

  # Warning low battery
  [[ $capacity -lt $low_battery_value ]] && notify-send -t 1000 "Battery warning"

  if [[ $status == "Not charging" || $status == "Discharging" ]]; then
    battery_style=("${discharging_battery_icon[@]}")
  elif [[ $status == "Charging" ]]; then
    battery_style=("${charging_battery_icon[@]}")
  fi

  [[ $capacity -le 0 ]] && icon="${battery_style[0]}"
  [[ $capacity -ge 0 && $capacity -le 10 ]] && icon="${battery_style[1]}"
  [[ $capacity -ge 10 && $capacity -le 20 ]] && icon="${battery_style[2]}"
  [[ $capacity -ge 20 && $capacity -le 30 ]] && icon="${battery_style[3]}"
  [[ $capacity -ge 30 && $capacity -le 40 ]] && icon="${battery_style[4]}"
  [[ $capacity -ge 40 && $capacity -le 50 ]] && icon="${battery_style[5]}"
  [[ $capacity -ge 50 && $capacity -le 60 ]] && icon="${battery_style[5]}"
  [[ $capacity -ge 60 && $capacity -le 70 ]] && icon="${battery_style[6]}"
  [[ $capacity -ge 70 && $capacity -le 80 ]] && icon="${battery_style[7]}"
  [[ $capacity -ge 80 && $capacity -le 90 ]] && icon="${battery_style[8]}"
  [[ $capacity -ge 90 && $capacity -le 100 ]] && icon="${battery_style[9]}"
  [[ $capacity -ge 100 ]] && icon="${battery_style[10]}"
  
  if [[ "$type" == "icon" ]]; then
    echo "${icon}"
  elif [[ "$type" == "value" ]]; then
    echo "${capacity}%"
  fi

}

label_template "$battery_status" "$battery_capacity" 
