#!/bin/bash

#To display the uid of user

uid=${UID}

echo "Your user id is $uid"

#Only display if the uid does not match 1000

if [ $uid -ne 1000 ]
then 
	echo "Your user id "$uid" does not match with 1000"
	#exit 1
fi

#Display the username

uname=$(id -un)
echo "Your user name is $uname"

#Test if the command execution was successful.

if [ $? -ne 0 ]
then
	echo "The command exexution was unsuccessful with exit code $?"
else 
	echo "The command execution was succesful"
fi

#Test if two strings are equal

if [ $uname == vagrant ]
then
	echo "Your username matches with vagrant"
fi

#Test if two strings do not match
if [ $uname != vagrant ]
then
	echo "Your username $uname doesn't match with vagrant"
fi

#Display the final result. 

echo "Programme executed successfully with exit status $?"

