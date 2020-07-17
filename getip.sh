#!/bin/bash
echo Local IPv4:
ip -4 a show eth0 | grep -Po 'inet \K[0-9.]*'

echo 
echo Public IP:
PUBLIC=`wget -qO- http://ipecho.net/plain`
echo $PUBLIC
