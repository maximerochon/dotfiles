#!/bin/bash
HDMI=`xrandr -q | grep "HDMI-1 connected" | wc -l`
DVI=`xrandr -q | grep "DVI-I-1-1 connected" | wc -l`
INTERNAL_OUTPUT="eDP-1"
SLEEP=2

if [ $HDMI -gt 0 ] && [ $DVI -gt 0 ]; then
    # Temporary disable the laptop screen
    xrandr --output $INTERNAL_OUTPUT --off --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
    sleep $SLEEP

    # Reconfigure all screens
    xrandr --output $INTERNAL_OUTPUT --primary --mode 1920x1080 --pos 3840x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
    sleep $SLEEP

    # Running the xrandr command twice seems to fix the background issue
    xrandr --output $INTERNAL_OUTPUT --scale 1.25x1.25
    sleep $SLEEP
    xrandr --output $INTERNAL_OUTPUT --scale 0.75x0.75

elif [ $HDMI -gt 0 ] || [ $DVI -gt 0 ]; then
    if [ $HDMI -gt 0 ]; then
        ACTIVE_OUTPUT="HDMI-1"
    else
        ACTIVE_OUTPUT="DVI-I-1-1"
    fi

    # Temporary disable the laptop screen
    xrandr --output $INTERNAL_OUTPUT --off --output $ACTIVE_OUTPUT --mode 1920x1080 --pos 0x0 --rotate normal
    sleep $SLEEP

    # Reconfigure all screens
    xrandr --output $INTERNAL_OUTPUT --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output $ACTIVE_OUTPUT --mode 1920x1080 --pos 0x0 --rotate normal
    sleep $SLEEP

    # Running the xrandr command twice seems to fix the background issue
    xrandr --output $INTERNAL_OUTPUT --scale 1.25x1.25
    sleep $SLEEP
    xrandr --output $INTERNAL_OUTPUT --scale 0.75x0.75

fi
