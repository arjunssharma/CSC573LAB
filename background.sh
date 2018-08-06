#!/bin/bash
#To Allow wireshark to access internal ports of hosts by adding iptable rules
while true; do
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
sudo iptables -t nat -A PREROUTING -d 152.46.18.224 -p tcp --dport 1702 -j DNAT --to 172.17.0.2:22
sudo iptables -t nat -A PREROUTING -d 152.46.18.224 -p tcp --dport 1703 -j DNAT --to 172.17.0.3:22
sudo iptables -t nat -A PREROUTING -d 152.46.18.224 -p tcp --dport 1704 -j DNAT --to 172.17.0.4:22
sudo iptables -t nat -A PREROUTING -d 152.46.18.224 -p tcp --dport 1705 -j DNAT --to 172.17.0.5:22
sleep 3
done