#!/system/bin/sh
# Figure out using `getevent'.
# Event: power button release. Because grep is run with -E, this can
# be several events delimeted with the | (pipe) character.
EVENTS="/dev/input/event1: 0001 0074 00000001"

/system/bin/getevent | /system/bin/grep -E "$EVENTS" |
    {
	while read LINE; do
	    /system/bin/log -t Magisk -p i "[XC5_GSI_tweaks] Detected relevant event. Applying fix."
	    /system/bin/echo check_connection > /sys/class/sec/tsp/cmd
	    /system/bin/log -t Magisk -p i "[XC5_GSI_tweaks] Fix attempt result: $(/system/bin/cat /sys/class/sec/tsp/cmd_result)"
	done
    }
