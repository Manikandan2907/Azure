#!/bin/bash 

#This script is all about generating random passwords and hashing it and making it more complex to be breached


#Generate a random number as password

password=$RANDOM
echo "$password"

#Using date command to generate a random/unique password {using ecpoch seconds to print the elapsed number of seconds which will every for every second}

password=$(date +%s)
echo $password

#Generate more complex password with more digits {using nano seconds option along with epoch second as defined above}

password=$(date +%s%N)
echo $password

#Generate a better password with checksum using sha*sum hashing

echo $password | sha256sum

#Getting only the required characters length using head

password=$(echo $password | sha256sum | head -c10)

#Getting the best password using fold and shuf commands
#Creating a random variable, shuffling it and appending some part of it to our password

some_values=$(echo '!@#$%^&*()_+' | fold -w1 | shuf | head -c1)
echo "$password$some_values" 
