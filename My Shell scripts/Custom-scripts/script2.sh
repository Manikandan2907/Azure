#!/bin/bash

uid=$(id -u)

# This will print your user id 

echo "Your user id is ${uid}"
# This will print your username

echo "Your username is $(id -nu)"
#This will check if you are root

if [ "${uid}" -eq 0 ]
then
	echo 'You are the root user'
else
	echo 'You are not root user'
fi
