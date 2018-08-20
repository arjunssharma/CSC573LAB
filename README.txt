=============================================================================================================================================================
# Steps to run CSC573LAB

Go to https://vcl.ncsu.edu for VCL Reservations

Use your college Username and password to reserve a VM under Reservations Tab

Click on New Reservation and select "Ubuntu 16.04 LTS Base" and Create Reservation

1. Login into the VM and copy CSC573LAB file using below command and change directory to CSC573LAB folder:

	"git clone https://github.com/CSC573LAB/CSC573LAB.git"
	             "cd CSC573LAB"

2. Give permissions to docker-env.sh file in CSC573LAB folder by using the below command:

        "chmod u+x docker-env.sh"

3. In CSC573LAB folder, Run the below command to install setup:

        "./docker-env.sh"

4. You can access the Management IP of the PC’s (PC1, PC2, PC3, PC4) in sequence of 172.17.0.2 ..... 172.17.0.254 respectively.  The IP's are provided in sequence to names provided in matrix.txt file (PC1,PC2,PC3,PC4), these hosts would get (172.17.0.2, 172.17.0.3, 172.17.0.4, 172.17.0.5) respectively.

5. You can login into the PC(PC1), Similary other PC's with username:root, password:passwd as below:

         "ssh root@PC1"

6. Once done with a particular PC, you can logout by typing exit from that PC.

#Caution

Please dont change any configuration related to eth0 in PC1, PC2, PC3, PC4 as you will lose ssh connection to them.

#Wireshark Capture:

1. You can download wireshark at https://www.wireshark.org/download.html on your laptop

2. Find the path where wireshark is installed(For Windows it would be mostly "C:\Program Files\Wireshark")

3. Open Command Prompt and enter below command:

         "cd C:\Program Files\Wireshark"

4. Open connection.txt file to view wireshark commands for respective PC.

5. In the command prompt, To take wireshark capture at an interface(eth1) of a particular PC(PC1 - 172.17.0.2), the port number would be 1702(last four digits from its IP), similary for PC2 with 172.17.0.3 it would be 1703.

#Importantly we should use IP of the reserved host from VCL which is(in my case 152.46.19.96), the only parameter that varies for different PC's is the part 

 after -p


         "ssh -X root@152.46.19.96 -p 1702 tcpdump -U -s0 -n -w - -i eth1 | wireshark -k -i -"

6. After executing above command, You will see wireshark getting started in your laptop, Go to command prompt and provide password as "passwd" in command prompt for wireshark to get access from the PC(PC1)

=============================================================================================================================================================
