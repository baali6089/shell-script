#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
n="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo -e "$2.... $R failure $N"
         exit 1
    else
         echo -e "$2....$G success $N"   
    fi       
}

if [ $USERID -ne 0 ]
then 
     echo "please run this script with root access."
     exit 1 #manually exit .if error comes
else
     echo "you are super user" 
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then 
         echo -e "$i already installed...$Y skipping $N"
    else
         dnf install $i -y &>>$LOGFILE
         VALIDATE $? "installation of $i"
    fi     
done             