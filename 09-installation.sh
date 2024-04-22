#!/bin/bash

USERID=$(id -u)

if
then 
     echo "please run this script with root access."
else
     echo "you are super user" 
fi

dnf install mysql -y