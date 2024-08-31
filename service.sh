#!/system/bin/sh
PRESS="00000001"; RELEASE="00000000"
POWER="/dev/input/event1: 0001 0074"
XCOVER="/dev/input/event6: 0001 00fc"

# Events to catch.
EVENTS="${POWER}${PRESS}|${XCOVER}${PRESS}|${XCOVER}${RELEASE}"

/system/bin/getevent | /system/bin/grep -E "$EVENTS" |
    {
	while read LINE; do
	    /system/bin/log -t Magisk -p i "[XC5_GSI_Fixes] Detected relevant event. Applying fix."
	    /system/bin/echo check_connection > /sys/class/sec/tsp/cmd
	    /system/bin/log -t Magisk -p i "[XC5_GSI_Fixes] Fix attempt result: $(/system/bin/cat /sys/class/sec/tsp/cmd_result)"
	done
    }
