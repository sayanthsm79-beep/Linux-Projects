#!/bin/bash

# Script: ping-check.sh
# Description: Pings servers from servers.txt and logs UP/DOWN status
# Author: Sayanth
# Date: April 2026

############################--Ping check script--#################################
log="/home/ubuntu/Shell-Scripts/ping-check-script/ping-result.txt"
servicefile="/home/ubuntu/Shell-Scripts/ping-check-script/servers.txt"
trap 'echo "Error at line $LINENO" >> $log; exit 1' ERR
echo "=========(Server Check : $(date))=========" >> "$log"
while read server;
do
        if ping -c 1  -W 2 "$server" &> /dev/null;
        then
                echo "$server is [UP] : $(date)" >> "$log"
        else
                echo "$server is [DOWN] : $(date)" >> "$log"
        fi
done < "$servicefile"
echo "" >> "$log"
cat "$log"
echo "Server check is done : check $log"

