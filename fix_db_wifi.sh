#!/bin/bash

ip_gateway=$(ip route show default | awk '/default/ {print $3}')
ip_gateway=${ip_gateway::-1}0
bridge=$(route -n | grep "$ip_gateway" | awk '{print $8}')
echo "$bridge"
if [[ $bridge != br-* ]]
then
	echo "No bridge found. Something went wrong. Aborting..."
	exit;
fi
#These need sudo rights
ifconfig $bridge down  
brctl delbr $bridge
