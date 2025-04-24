#!/bin/bash

#This is to demonstrate the case statement


#Traditional way {IF}


#if [ $1 = "start" ] 
#then
#	echo "Starting"
#elif [ $1 = "stop" ]
#then
#	echo "Stopping"
#elif [ $1 = "status" ]
#then
#	echo "Status: "
#else
#	echo "Pass a valid argument"
#fi


# A better way to match patterns {Case}

case $1 in 
	start)	
		echo "Starting"	
		;;
	stop)	
		echo "Stopping"	
		;;
# Multiple condition/pattern matching
	status|state)	
		echo "Status: "	
		;;
# Wildcard {Like else}
	*)	
		echo "Pass a valid argument"	
		;;
esac







# A less complex syntax

case $1 in 
	start) echo "Starting1";;
	stop) echo "Stopping1" ;;
	stat*) echo "Status1: " ;;
	*) echo "Pass a valid argument1" ; exit 1 ;;
esac
