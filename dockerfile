FROM ubuntu:latest

MAINTAINER CSC-IP-LAB


RUN apt-get update -qq && apt-get -y --force-yes install openssh-server net-tools curl iproute2 iputils-ping traceroute tcpdump vim python python-pip python-pexpect
RUN pip install --upgrade pip
RUN pip install paramiko
RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN /usr/sbin/sshd
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump
RUN ln -s /usr/bin/tcpdump /usr/sbin/tcpdump
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
