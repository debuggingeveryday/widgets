#!/bin/sh

if [[ "${@}" =~ "component" ]]; then
  [[ "${#@}" -gt 2 ]] && echo "Error: too much arguments" && exit 1
  
  name="$2"
  mkdir -p ./panel-bar/components/$name/scripts
  touch ./panel-bar/components/$name/{${name}.yuck,${name}.scss}
fi
