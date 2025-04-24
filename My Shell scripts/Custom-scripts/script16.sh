#!/bin/bash

# This script is capable of deleting, disabling, archiving, and deleting a user's home directory.

archive_directory=/tmp/archive
delete_user=false

# Check if the script is executed with proper permissions
if [ $UID -ne 0 ]
then
    echo "Please execute this script with sudo privilege or as root." 1>&2
    exit 1
fi

# Function to display messages
log() {
  local message="$@"
  echo "$message"
}

# Function to check the exit status
status() {
  if [ $? -ne 0 ]
  then
    log "$1"
    exit 1
  else
    log "$2"
  fi
}

# The actual function
deluser() {
  for user in "$@"
  do
    log "Processing the user $user"
    userid=$(id -u "$user")
    if [ $userid -lt 1000 ]
    then
      log "Restricting the deletion of the user $user with uid $userid" 1>&2
      exit 1
    fi

    # Archive part
    if [ "$archive_dir" = true ]
    then
      if [ ! -d "$archive_directory" ]
      then
        log "Creating the directory $archive_directory for archiving the user's files"
        mkdir -p "$archive_directory"
        status "The archive directory $archive_directory was not created successfully" "The archive directory $archive_directory was created successfully"
      fi
      home_dir="/home/$user"
      log "Archiving $home_dir to $archive_directory"
      archive_file="$archive_directory/${user}.tgz"
      if [ -d "$home_dir" ]
      then
        tar -zcf "$archive_file" "$home_dir" > /dev/null 2>&1
        status "Could not archive the user's files" "Archieve successfull"
      else
        log "The Home directory $home_dir is not found or no such file is available" 1>&2
        exit 1
      fi
    fi

    # Delete part
    if [ "$delete_user" = true ]
    then
      userdel $remove_home_dir $user
      status "The user account $user is not deleted" "The user account $user is deleted" 1>&2
    else
      chage -E 0 "$user"
      status "Disabling the user $user is unsuccessful" "The user $user was disabled successfully"
      if [ $? -eq 0 ] 
      then 
          log "The account $user is disabled successfully"
      fi
    fi



  done
}

while getopts dra option
do
  case $option in
      d) delete_user=true ;;
      r) remove_home_dir='-r' ;;
      a) archive_dir=true ;;
      ?) log "Invalid argument" 
	 exit 1
	 ;;
  esac
done

shift $((OPTIND - 1))

if [ $# -lt 1 ]
then
  log "Pass the required arguments" 1>&2
  exit 1
fi

deluser "$@"

exit 0

log "The program executed successfully with exit code $?"
