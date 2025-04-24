#!/bin/bash

#This script is for parsing the sample syslog file and logs processing

#Let the input file be file which is an argument to the script.

file=$1

#Check if required arguments are passed 

if [ $# -lt 1 ]
then
echo	"Please specify the file name to be processed"
fi 

#Check if the file is actually existing.

if [ ! -e $file ]
then
	echo "Couldn't open $file for processing"
	exit 1
fi

#Actual process to find the ip's and their country if the count is more than 10.

limit=10

#Disaply the header
echo "count,ip,location"

grep "Failed" $file | awk -F " " '{print $(NF - 3)}' | sort -n | uniq -c | sort -n | while read count ip 
do 
if [ $count -gt $limit ]
then
	location=$(geoiplookup $ip | awk -F ", " '{print $2}')
	echo $count,$ip,$location
fi
done 

