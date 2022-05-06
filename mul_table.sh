#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022
# Nian Deng 041042631 deng0066@algonquinlive.com
#argument should equ to 2 
if [ $# -ne 2 ] ; then
        #if argument not equ to 2 then display error messege  
	echo "Error: Incorrect number of arguments" >&2
	# teminate with error code
	exit 1
#end of if statment
fi
#valid range should be fist argument small than second
if [ $1 -ge $2 ] ;then
	#if $1 big or equ to $2 display error messge
       echo "Error: The range provided is invalid" >&2
       #terminate with error code
	exit 1
#end of if statement
fi	
#for loop in row
for row in $(seq $1 $2); do
	#for loop in the colomn
	for col in $(seq $1 $2);do
		# display the multipcation result -n do not append a new line
		echo -n $(($row*$col))
		#-e horizontal tab 
		echo -ne "\t"
	#end of inner for loop
	done
	#add newline
	echo
#end of for loop
done
