#!/bin/bash

#Display the parameters that are passed to the cli

echo "Param1: $1"
echo "Param2: $2"
echo


#Loop through the parameters

while [ $# -gt 1 ]
do
	echo "Parameter is: $@"
	echo "The number of Parameters are: $#"
	echo
	shift 
#The shift command will decrease the number of parameters once it is executed{The First parameter disappear}
done

