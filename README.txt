=============================================================================================================================================================
# Steps to run CSC573LAB

Go to https://vcl.ncsu.edu for VCL Reservations

Using your college Username and password to reserve a VM under Reservations Tab

Click on New Reservation and select "Ubuntu 16.04 LTS Base"

1. To Modify Topology of the setup, Change it in matrix.txt

2. Give permissions to docker-env.sh file in CSC573LAB folder by using the below command:

    chmod u+x docker-env.sh

3. In CSC573LAB folder, Run the below command to install setup:

    ./docker-env.sh

4. Once Everything is installed, You can access the Management IP of the VM's in range of 172.17.0.2 ..... 172.17.0.254, The IP's are provided in sequence to
names provided in matrix.txt file (H1,H2,H3,H4), these hosts would get (172.17.0.2, 172.17.0.3, 172.17.0.4, 172.17.0.5) respectively.

5. You can login into the host(H1), Similary others with username:root, password:passwd as below:

     ssh root@H1

6. Once done with a particular host, you can logout by typing exit from that VM.

#Wireshark Capture:

1. You can download wireshark at https://www.wireshark.org/download.html on your laptop

2. Find the path where it is installed(For Windows it would be mostly "C:\Program Files\Wireshark")

3. Open Command Prompt and enter below command:

   cd C:\Program Files\Wireshark

4. In that command prompt, To take wireshark capture at any interface(eth1) of a particular host(H1 - 172.17.0.2), the port number would be 1702(last four digits from its IP), similary for H2 with 172.17.0.3 it would be 1703.
#Importantly we should use IP of the reserved host from VCL which is 152.46.19.96, the only parameter that varies for different Hosts is the part after -p


    ssh -X root@152.46.19.96 -p 1702 tcpdump -U -s0 -n -w - -i eth1 | wireshark -k -i -

5. After executing above command, You will see wireshark getting started in your laptop, Go to command prompt and provide password as "passwd" in command prompt for wireshark to get access from the Host(H1)

=============================================================================================================================================================