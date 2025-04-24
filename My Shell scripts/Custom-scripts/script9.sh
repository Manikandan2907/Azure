#!/bin/bash

#This script has some examples of I/O redirection with File descriptors


#Redirect STDOUT to a file

file="/tmp/data"
head -n1 /etc/passwd > $file
cat $file
#Redirect STDIN for a file

read lines < $file
echo
echo "Contents of Line are : "
echo $lines

#Ovewrite the contents of a file 
echo
head -n3 /etc/passwd > $file
cat $file

#Redirect the STDOUT by appending 
echo
echo "The appended version of the file is: "
head -n2 /etc/group >> $file
cat $file
