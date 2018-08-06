import os
topology_file = open('matrix.txt','r')  # opening file
topology_line = topology_file.readline().strip().split()

fip = os.popen('ifconfig eth1 | grep "inet\ addr" | cut -d: -f2 | cut -d" " -f1') #to retrieve IP address of reserved VCL host
HOST_IP=fip.read().strip()
bg_file = open('background.sh','a')  #opening file in append mode
#bg_file.write("\n")
for i in topology_line:
#To get docker IP using this command
    dip = os.popen("docker inspect -f \'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}\' "+i)
    DOCKER_IP = dip.read().strip()
#To format port IP of the individual container as per last 3 octects of IP(1702 for 172.17.0.2)
    portip = os.popen("docker inspect -f \'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}\' "+i+"| cut -d \".\" -f 2-4 | awk -F. \'{print $1\"\"$2\"\"$3}\'")
    PORT_NO = portip.read().strip()
#appending lines to background.sh file
    line1 = "sudo iptables -t nat -A PREROUTING -d {} -p tcp --dport {} -j DNAT --to {}:22".format(HOST_IP, PORT_NO, DOCKER_IP)
    bg_file.write(line1+"\n")
bg_file.write("sleep 3"+"\n"+"done")

#To access host details host file in etc directory
host_file = open('/etc/hosts','a')
for i in topology_line:
    dip = os.popen("docker inspect -f \'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}\' " + i)
    DOCKER_IP = dip.read().strip()

    line3 = "{} {}".format(DOCKER_IP, i)
    host_file.write(line3 + "\n")
host_file.close()




