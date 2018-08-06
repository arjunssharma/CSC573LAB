#!/usr/bin/python

topology_file = open('matrix.txt','r')   #open file
topology_line = topology_file.readline().strip().split()
f = open('Nodes.yaml', 'w')
f.close()
f =open('Nodes.yaml','a')
f.write("Nodes:\n")
result = [f.write("  - "+node+"\n") for node in topology_line] #to write list of nodes into Nodes.yaml
