#!/bin/bash

# Turns on second screen 
# Puts the first one on the right of the second one
resolve_display() {
	echo "Turning on the screen"
	xrandr --output HDMI-2 --auto

	if [ "$1" = "right" ] 
	then
		echo "Setting the screen on the right of the computer"
		xrandr --output HDMI-2 --right-of eDP-1			
	else
		echo "Setting the screen on the left of the computer"
		xrandr --output HDMI-2 --left-of eDP-1	
	fi	
	
	return
}

# Handles the event which occured when a new screen is connected to the computer
screen_daemon() {
	status=$(cat /sys/class/drm/card0/*HDMI-A-2/status)
	
	# If the screen is connected and the setting has not been done,
	# the resolving function is executed
	if [ $(cat /sys/class/drm/card0/*HDMI-A-2/status) =  "connected" ] && [ $already_done -eq 1 ]; then
		sleep 1
		echo "Screen connected: setting the display"
		resolve_display
		already_done=0

		return 
	# If the screen is disconnected and the setting has already been done,
	# the global variable is reset
	elif [ $(cat /sys/class/drm/card0/*HDMI-A-2/status) =  "disconnected" ] && [ $already_done -eq 0 ]; then
		echo "Screen disconnected: reset"
		already_done=1

		return
	fi
	
	return 
}

already_done=1 

while true; do
	screen_daemon 
done
exit 0
