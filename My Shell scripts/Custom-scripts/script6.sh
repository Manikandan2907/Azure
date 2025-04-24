#!/bin/bash

#Display what the user has types on the command line

Type=$(basename $0)
Path=$(dirname $0)
echo "You have recently executed $Type in the path $Path"


#Display the number of arguments passed to the cli

echo "You have passed $# argument(s) to the cli"


#Display random passwords to different users using FOR loop

for i in $@
do 
	password=$(date +%s%N | sha256sum | head -c18)
 	echo "The password for $i is $password"
done
