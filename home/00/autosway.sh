#!/usr/bin/env bash
########################################
# autoexec script after sway reload
########################################


/home/00/autosway/kill.sh

/home/00/autosway/sway.sh &
/home/00/autosway/sfwr.sh &

/home/00/autosway/rest.sh &


