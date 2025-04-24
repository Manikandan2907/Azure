#!/bin/bash


#This is an advanced script with some more conditions to create a user account


#Check if the script is executed as sudo or root access

if [ ${UID} -ne 0 ]
then 
	echo "Execute this script with sudo or as root"
	exit 1
fi

#Get the username for the account

read -p "Enter the login name for the account to be created: " uname

#Get the name of the user or the application for which the account is created

read -p "Enter the actual name of the user/Application or the ticket number of this request: " comments

#Get the password for the account

read -p "Enter the password for the user: " password

#Create user 

useradd -c $"{comments}" -m $uname

if [ ${?} -ne 0 ]
then 
	echo "Account creation was unsuccesful"
	exit 1
fi

#Generate the password for the account

echo ${password} | passwd --stdin ${uname}


if [${?} -ne 0 ]
then 
	echo "Password was not set successfully"
	exit 1
fi

#Set password expiry 

passwd -e ${uname}

#Disaply the creds

echo 
echo "login name: "${uname}""
echo 
echo "Password: "${password}""
echo
echo "Hostname: $HOSTNAME"

if [ $? -eq 0 ]
then 
echo "Programme executed successfully with exit status $?"
exit 0
fi

