#!/bin/bash
echo Hostname: $(hostname)
echo Operating System: $(cat /etc/os-release | grep "PRETTY_NAME" | awk -F= '{print $2}' | sed 's/"//g')
echo Total RAM: $(grep MemTotal /proc/meminfo | awk '{print sprintf("%.0f", $2/1024/1024)}') GB
echo

echo Local IPv4:
ifconfig `route | grep ^default | sed "s/.* //"` | grep -Po '(?<=inet )[\d.]+' | awk '{print $1}'
#ifconfig `route | grep ^default | sed "s/.* //"` | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | awk '{print $1}'

echo 

PUBLIC=`wget -qO- http://ipecho.net/plain`
echo Public IP: $PUBLIC
