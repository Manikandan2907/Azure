#!/bin/bash

#Check if the scipting is executed with proper permission 

if [ $UID -ne 0 ]
then
	echo "Execute the script with sudo privilege or as root" 1>&2
	exit 1
fi

#Check if the script is executed with sufficient arguments

if [ $# -lt 1 ]
then
	echo "Please provide the required inputs" 1>&2
	exit 1
fi

#Assign the username {Using the first parameter as username}

uname=$1

#Assigning the comments for that user {Using the other positional parameters as comments}

shift

comments=$@

#Create the user 

useradd -c "$comments" -m $uname > /dev/null 2>&1

#check the status

if [ $? -ne 0 ]
then
	echo "The account creation was not successful" 1>&2 
fi

#Generate the password

password=$(date +%s%N | sha256sum | head -c16)  2>&1

#Assign the password

echo $password | passwd --stdin $uname

#Set the password expiry

passwd -e $uname 2>&1 


#Display the details of the user 

echo
echo "The login name is: $uname"
echo
echo "The pasword is: $password"
echo
echo "The hostname is: $HOSTNAME "
echo 

echo "The programme executed successfully with exit status $?"
