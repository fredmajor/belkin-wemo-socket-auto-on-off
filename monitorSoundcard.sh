#!/bin/bash
set -u

OFF_THRESHOLD="120"
PROBE_F="1"
STATUS_FILE="/proc/asound/card0/pcm0p/sub0/status"
AMP_ON="$HOME/bin/turnAmpOn.sh"
AMP_OFF="$HOME/bin/turnAmpOff.sh"
TIME_CMD="date +%s"

let lastOffTime=lastOnTime=musicOffDetectionTime=`$TIME_CMD`
musicOffAlreadyDetected=0

while true; do
	grep "closed" "$STATUS_FILE" &>/dev/null
	rc=$?; 
	if [[ $rc != 0 ]]; then #the music is on
		musicOffAlreadyDetected=0
		if (( $lastOffTime >= $lastOnTime )); then
			eval "$AMP_ON"
			lastOnTime=`$TIME_CMD`
			echo "amp turned on"
		fi
	else #the music is off
		if [ $musicOffAlreadyDetected -eq 0 ]; then #the lack of music has not been detected yet
			musicOffDetectionTime=`$TIME_CMD`
			musicOffAlreadyDetected=1
			echo "detected lack of music for the fist time"
		fi
		now=`$TIME_CMD`
		offDetectionInt=$(( $now - $musicOffDetectionTime ))
		if (( $offDetectionInt >= $OFF_THRESHOLD )); then
			if (( $lastOnTime >= $lastOffTime )); then
				eval "$AMP_OFF"
				lastOffTime=$now
				echo "amp turned off"
			fi
		fi
	fi

	sleep $PROBE_F
done
