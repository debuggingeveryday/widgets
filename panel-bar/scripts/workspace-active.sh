#!/bin/sh

declare -r workspace=$(bspc query -d -D --names)
echo $workspace
