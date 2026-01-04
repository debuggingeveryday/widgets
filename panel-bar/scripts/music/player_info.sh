#!/bin/sh

exitingText() {
  param=-$1
  echo ${playing:0:param}
}

enteringText() {
  param=$1
  words=$((length-param))
  echo ${playing:words:param}
}


while true; do
 playing=$(playerctl metadata --format '{{ artist }} - {{ title }}' &> /dev/null )
 length=${#playing}

 if [[ ! -z "$playing" ]]; then
  count=$((count+1))
  enter=$(exitingText $count)
  exit=$(enteringText $count)
 
  echo "${exit} ${enter}"
  
  if [[ $count -ge $length ]]; then
   count=0
  fi

 else
   echo ""
 fi
 sleep 0.5s
done
