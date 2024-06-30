#!/bin/sh

declare -rA track=$(playerctl metadata --format '(["artist"]="{{artist}}" ["image"]="{{mpris:artUrl}}" ["title"]="{{title}}" ["album"]="{{album}}"
)')

if [[ ${#@} -gt 1 ]]; then
  echo "Error: too much argument(s)" && exit 1
fi

if [[ ! ${!track[@]} =~ $1 ]]; then
  echo "Error: value not found in array" && exit 1
fi

if [[ $1 == "image" ]]; then
  echo ${track["image"]} | sed 's/file:\/\///g'
else
  echo ${track[$1]}
fi
