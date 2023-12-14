#!/bin/bash
#Startup Script -original

a=`date` 

echo "Welcome,would you like to see the date?"
read input 
if [ "$input" == "yes" ]
then 
	echo "Today is $a"
else 
	echo "Here is your system activity report." 
        sar 4 4 
fi
echo
echo "Is the date correct(yes/no)"
read answer 
if [ "$answer" == "yes" ]
then 
	echo "Have a good day"
else
	echo "I restarted the chrony service for you"
	systemctl restart chronyd 
	tail /var/log/messages | grep -i "starting" 
fi 
echo "Have a good day."

