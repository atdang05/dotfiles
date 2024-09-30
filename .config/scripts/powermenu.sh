#!/bin/sh

chosen=$(printf "Log Out\nSuspend\nReboot\nPower Off" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

case "$chosen" in
    "Log Out") i3-msg exit ;;
    "Suspend") systemctl suspend && betterlockscreen --lock ;;
    "Reboot") systemctl reboot ;;
    "Power Off") systemctl poweroff ;;
    *) exit 1 ;;
esac