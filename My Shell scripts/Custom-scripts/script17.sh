#!/bin/bash

#This script is mainly used to process the netstat command

# Use -n -- name, -u --udp, -t --tcp, -l --listening and -p for programme.

netstat -nutl | grep ":" | awk '{print $4}' | awk -F ":" '{print $NF}'
