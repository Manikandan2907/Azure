#!/bin/bash

#Thi script is capable of Creating a user and set a password for it in the real time.


#Get the username for the user

read -p "Enter the username of the user: " uname

#Get the Actual name of the user(Comments)

read -p "Enter the Details and actual name of the user: " comments

#Get the password for the user

read -p "Enter the password for you user: " password
#Creating user (Backgrounded)

useradd -c "$comment" -m $uname

#Set the password for the user(Backgrounded)

echo $password | passwd --stdin $uname

#Set immediate password expiry

passwd -e $uname
