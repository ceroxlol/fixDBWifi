#!/bin/bash

ip_gateway=$(ip route show default | awk '/default/ {print $3}')
echo "ip gateway: $ip_gateway"
ip_gateway=${ip_gateway::-1}0
echo "ip gateway last digit cut: $ip_gateway"
bridge=$(route -n | grep "$ip_gateway" | grep "br-" | awk '{print $8}')
echo "bridge: $bridge"
if [[ $bridge != br-* ]]
then
	echo "No bridge found. Something went wrong. Abort..."
	exit;
elif [[ $bridge = wl* ]]
then
	echo "Bridge most likely down already. Abort..."
	exit;
fi
echo "ifconfig $bridge down..."
ifconfig $bridge down
echo "brctl delbr $bridge..."
brctl delbr $bridge
