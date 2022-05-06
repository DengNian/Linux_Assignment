#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022
# Nian Deng 041042631 deng0066@algonquinlive.com
#check argments equal to 1
if [ $# -ne 1 ]; then
	#Display error message
	echo "Error: Incorrct number of arguments." >&2
	#exit with code 1
        exit 1
#if end
fi
#find user name in /etc/passwd
data=$(grep -w "$1:x" /etc/passwd)
#check weather find the user in passwd
if [ $? -ne 0 ]; then
	#Display error infomation
	echo "Error: User not exist" >&2
	#exit with code 1
	exit 1
#end of if
fi
#data header
dataHeader=("Login name:" "Password:" "UID:" "GID:" "Comment:" "Home directory:" "Shell:");
#for loop output the dataheader and fields
for ((i=0; i<${#dataHeader[@]}; i++)); do
	#display dataheader 
	echo -ne  "${dataHeader[$i]} "
	#display fields
	echo $data | cut -d ':' -f  $(($i+1)) 
#end of for loop
done


