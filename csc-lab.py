from math import *
import pexpect
import os
import subprocess
import sys

node_matrix = open('matrix.txt','r')     #  To open a file in read mode
node = node_matrix.read()
node_row = node.strip().split("\n")
nodes = node_row[0].strip().split()
node_num = len(nodes)

PID=['p']
for i in range(0,node_num):
# To get the process ID of hosts(containers)
  output = subprocess.Popen("sudo docker inspect -f '{{.State.Pid}}' "+nodes[i], stdout=subprocess.PIPE, shell=True)
  (out, err) = output.communicate()
  PID.append(out.strip())

# i = 0
# j = 0
#
# cmd1 = "sudo ip link add veth1 type veth peer name veth2"
# cmd2 = "sudo ip link set dev veth1 netns " + pids[i] + " name eth" + str(j) + " up"
# cmd3 = "sudo ip link set dev veth2 netns " + pids[j] + " name eth" + str(i) + " up"
#
# cmd_list = [cmd1, cmd2, cmd3]
#
# cmd_output = [os.system(cmd) for cmd in cmd_list for i in range(1,(node_num+1)) for j in range(i,(node_num+1)) if node_row[i].strip().split()[j] == "1"]
for i in range(1,(node_num+1)):
    current_node = node_row[i].strip().split()

    for j in range(i,(node_num+1)):

        if current_node[j] == "1":
            os.system("sudo ip link add veth1 type veth peer name veth2")  #To create veth pairs to connect the containers as per topology
            os.system("sudo ip link set dev veth1 netns " + PID[i] + " name eth" + str(j) + " up")
            os.system("sudo ip link set dev veth2 netns " + PID[j] + " name eth" + str(i) + " up")
for i in nodes:
    os.system("sudo docker exec "+i+" /etc/init.d/ssh restart")
    child = pexpect.spawn("sudo docker exec -i -t " + i + " passwd root")
    child.expect('Enter new UNIX password:')
    child.sendline('passwd')        #To provide password for root user
    child.expect('Retype new UNIX password:')
    child.sendline('passwd')
    child.expect('passwd: password updated successfully')
    child.expect('\n')
