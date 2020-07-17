#!/bin/bash
echo Local IPv4:
ifconfig `route | grep ^default | sed "s/.* //"` | grep -Po '(?<=inet )[\d.]+' | awk '{print $1}'

echo 
echo Public IP:
PUBLIC=`wget -qO- http://ipecho.net/plain`
echo $PUBLIC
