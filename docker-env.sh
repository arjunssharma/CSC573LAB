#!/bin/bash

echo -e "\n\n******Starting with environment setup******\n"
sudo hostname localhost

sudo add-apt-repository -y ppa:apt-fast/stable

sudo apt-get -y update

echo debconf apt-fast/maxdownloads string 16 | sudo debconf-set-selections
echo debconf apt-fast/dlflag boolean true | sudo debconf-set-selections
echo debconf apt-fast/aptmanager string apt-get | sudo debconf-set-selections

sudo apt-get -y install apt-fast

sudo apt-fast -y install qemu-kvm &

sudo apt-fast -y install libvirt-bin &

sudo apt-fast -y install bridge-utils &

sudo apt-fast -y install virt-manager &

sudo apt-fast -y install virt-viewer &

sudo apt-fast -y install libguestfs-tools &

wait


sudo apt-fast -y install python-libvirt

sleep 1

sudo apt-fast -y install libvirt-doc


sudo apt-fast install -y python-pip


sudo pip install --upgrade pip

sudo pip install docker



sleep 1



sudo apt-fast install python-paramiko -y



sleep 1



sudo apt-fast install python-yaml -y




sleep 1



sudo sysctl -w net.ipv4.ip_forward=1


sudo apt-fast update &


sudo apt-fast -y upgrade

wait


sudo apt-fast install -y software-properties-common &



sleep 1



sudo apt-add-repository -y ppa:ansible/ansible



sleep 1



sudo apt-fast update



sleep 1



sudo apt-fast -y install ansible



sleep 1



sudo usermod -a -G libvirtd $USER



sudo sed -i -e 's/#user/user/g' /etc/libvirt/qemu.conf



sudo sed -i -e 's/#group/group/g' /etc/libvirt/qemu.conf



sudo service libvirtd restart

################################################# DOCKER SETUP HERE ONWARDS ###############################################

echo -e "\n*********Setting up docker environment now!\n"



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -




sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"



sleep 1



sudo apt-fast update




sudo apt-fast install -y docker-ce



sleep 1



sudo sed -i  's|ExecStart=/usr/bin/dockerd -H fd://*|ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375|' /lib/systemd/system/docker.service



sudo service docker stop



sleep 1



sudo systemctl daemon-reload



sleep 1



sudo service docker start



sleep 1



sudo pip install ipcalc



echo -e "\n**** Docker Installation done ****\n\n"


echo -e "\n\n******Environment setup completed! ****\n"

echo -e "\n\n******Creating Topology ****\n"

sudo ansible-playbook /home/$(whoami)/CSC573LAB/Topology_script.yml
echo -e "\n\n******Find the below connections at connection.txt file ****\n"
cat connection.txt

sed -i -e 's/\r$//' background.sh

chmod u+x background.sh

./background.sh &

echo "Total setup completed..."
