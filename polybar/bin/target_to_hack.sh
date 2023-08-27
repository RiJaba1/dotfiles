#!/bin/bash
# Modified by RiJaba1

ip_address=$(cat ~/.config/polybar/bin/target.txt | awk '{print $1}')
machine_name=$(cat ~/.config/polybar/bin/target.txt | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    status=$(ping -c 1 -W 1 $ip_address | grep received | awk '{print $4}')
    ttl=$(ping -c 1 -W 1 $ip_address | grep "ttl=" | awk '{print $6}' | awk '{print $2}' FS="=")
    if [ $status -eq 0 ]
    then
	echo "%{F#e51d0b} $ip_address - $machine_name"
	else
	if [[ $ttl -le 65 ]];then
		echo "%{F#1bbf3e} $ip_address - $machine_name"
		export
	else
		echo "%{F#1bbf3e} $ip_address - $machine_name"
		export
	fi
    fi
else
	echo "%{F#e5e5e5}ﲅ No target found!"
fi
