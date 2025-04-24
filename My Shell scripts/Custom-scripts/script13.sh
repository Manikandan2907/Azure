#!/bin/bash

#Thus script is to demonstrate functions

#function defination

log() {
	local message=$@
	if [ "$verbose" = true ]
	then
		echo $message
	fi
	logger -t test $message
}


#Calling the function 
#We can pass the arguments for a function while calling the function or while executing the script in the cli level.
verbose=true

backup() {
	local file=$1
	if [ -f $file ]
	then
		local backup_file="/var/tmp/$(basename $file).$(date +F%N)" 
		log "taking backup of $file to $backup_file"
		cp -pr $file $backup_file  
	else
		return 1

	fi
}

backup $@

if [ $? -eq 0 ]
then
	log "backup successfull"
else
	log "backup failed"
	exit 1
fi



