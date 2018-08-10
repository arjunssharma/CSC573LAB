#!/bin/bash
#To Allow wireshark to access internal ports of hosts by adding iptable rules
while true; do
sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
