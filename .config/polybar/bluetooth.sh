#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
  echo "%{F#707880}󰂲%{F-}"
elif [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then 
  echo "%{F#F0C674}󰂯%{F-} %{F#707880} Not connected%{F-}"
else
  MACADDRESS=`echo info | bluetoothctl  | grep 'Device' | awk '{ print $2 }'`
  NAME=`bluetoothctl info $MACADDRESS  | grep Name | cut -c8-`
  LENGTH=${#NAME}
  if [ $LENGTH -gt 15 ]; then
    SHORTNAME="${NAME:0:15}..."
  else
    SHORTNAME=${NAME:0:15}
  fi
  echo "%{F#F0C674}󰂱%{F-} %{F#C5C8C6} $SHORTNAME%{F-}"
fi
