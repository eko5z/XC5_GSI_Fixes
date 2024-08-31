#!/system/bin/sh
PRESS="00000001"; RELEASE="00000000"
POWER="/dev/input/event1: 0001 0074"
XCOVER="/dev/input/event6: 0001 00fc"
# Events to catch.
EVENTS="${POWER} ${PRESS}|${XCOVER} ${PRESS}|${XCOVER} ${RELEASE}"

FLASH_FILE="/sys/class/camera/flash/rear_flash"

/system/bin/getevent | /system/bin/grep -E "${EVENTS}" |
    {
	while read LINE; do
	    case "${LINE}" in
		"${POWER} ${PRESS}")
		    # On power press, we do what febeslmeisl did. It
		    # seems to work more reliably on power press than
		    # the originally conceived release.
		    /system/bin/log -t Magisk -p i "[XC5_GSI_Fixes] Detected relevant event. Applying fix."
		    /system/bin/echo check_connection > /sys/class/sec/tsp/cmd
		    /system/bin/log -t Magisk -p i "[XC5_GSI_Fixes] Fix attempt result: $(/system/bin/cat /sys/class/sec/tsp/cmd_result)"
		    ;;
		"${XCOVER} ${RELEASE}")
		    /system/bin/echo "$((1-$(/system/bin/cat ${FLASH_FILE})))" > "${FLASH_FILE}"
	            /system/bin/log -t Magisk -p i "[XC5_GSI_Fixes] Toggled flashlight."
		    ;;
	    esac
	done
    }
