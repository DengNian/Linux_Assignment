#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022
# Nian Deng 041042631 deng0066@algonquinlive.com
#variable used record exit status,default 0 no error
status=0
#for ln command the arguments should at least 2
if [ $# -lt 2 ]; then
	#if arguments less than 2 display error message
	echo "Error: Incorrect number of arguments" >&2
	#exit with status 1
	exit 1
#end of if statement
fi

#TARGET not exist
if [ ! -f "$1" ]; then
	# if true display error message
	echo "Error: $1 not exists" >&2
	#exit with status 1
	exit 1
#end of statement if
fi
#for loop enumerate the LINK_NAME(S)
for ((n=2; n<=$#; n++)) ; do
        #check if the LINK_NAMe exist
	if [ -f "${!n}" ]; then
		#if true,display error message
		echo "Error: ${!n} already exists" >&2
		#record the error status
		status=1
	#if false, LINK_NAME not exist
	else
		#hard link execute
		ln "$1" "${!n}"
	#end of if statement
	fi
#end of for loop
done
#return the exit status at the end
exit $status

