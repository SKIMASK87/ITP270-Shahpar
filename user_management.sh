#!/bin/bash
#
#This script creates a new user on the local system.
#We will be prompted to enter the username, the real name and passwored.
#After creating the user, the script should show us the username, password, and hostname, 

#Make sure the script is being executed by root user. 

if [ "${UID}" -ne 0 ]
then
	echo "Please run the program as root."
	exit 1
else
	echo "Thanks for running the script as root." 
fi

#Get the username (login) 
read -p 'Enter the username to create: ' USER_NAME

#Get the full name
read -p 'Enter the full name for the user: ' COMMENT

#Get the password
read -p 'Enter the password to use for the account: ' PASSWORD


#Adding the user
useradd -c "${COMMENT}" -m ${USER_NAME}

#Check if the last command got executed with exit code 0
if [ "${?}" -ne 0 ]
then
	echo "The account could not be created." 
	exit 1
fi

#Adding the user password
usermod -p ${PASSWORD} ${USER_NAME}

#Check if the last command got executed with exit code 0
if [ "${?}" -ne 0 ]
then
        echo "The account could not be created." 
        exit 1
fi


#Display the username (login), password and the host for the user

echo
echo 'Username: '
echo ${USER_NAME}
echo
echo 'Password: '
echo
echo 'host: '
echo ${HOSTNAME} 
exit 0
