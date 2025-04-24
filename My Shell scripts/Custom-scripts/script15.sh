#!/bin/bash

#This script will delete a user passed as an argument to it. 


#Check If the script is executed with proper permission

if [ $UID -ne 0 ]
then
	echo "Execute this script with sudo privilege or as root" 1>&2
	exit 1
fi


#user as the first argument

user=$1

#Delete the user 

userdel $user

#Check if the deletion is successful. 

if [ $? -ne 0 ]
then
	echo "The user accout $user is not deleted" 1>&2
	exit 1
fi

echo "The programme executed successfully with exit status $? and the user sccount $user is deleted successfully"

exit 0
