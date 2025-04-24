#!/bin/bash

#This script explains us about the usage of getopts and using functions to process the options that are passed as an argument. 

#The user may or may not use the l option so specify the length now.

length=5
use_special_character=false

#The verbosity function

say() {
	local message=$@
	if [ "$verbose" = true ]
	then
		echo $message	
	fi	
}


#The password function
password() {
	Password=$(date +%s%N$RANDOM$RANDOM | sha256sum | head -c$@)
	if [ "$use_special_character" = true ]
	then
		special_character=$(echo "!@#$%^&*()_+=" | fold -w1 | shuf | head -c1)
		Password=$Password$special_character
	fi  
} 


while getopts vl:s option
do
	case $option in
		v)
			verbose=true
			say "Verbose mode is enabled"
			;;
		l)
			length=$OPTARG
			password "$length"
			;;
		s)
			use_special_character=true
			password "$length" 
			;;
		?)
			echo "Invalid option"
			exit 1
	esac
done

#To treat all the arguments other than options error
#The OPTIND variable stores the position of the argument that is next to the option in getopts
#By shifting the options we can find if there is any other arguments than the optins and we force the user to pass only the options as arguments

shift $(( OPTIND - 1 ))

if [ $# -gt 0 ]
then
        echo "Pass only the options as arguments"
        exit 1
fi

say "Generating password as per your requirement"
#Display the contents to the user. 

say "Password generation is successful"
if [ "$?" -eq 0 ]
then
echo "The password is $Password"
fi

