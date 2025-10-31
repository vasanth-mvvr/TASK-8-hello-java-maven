#/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%I:%M:%S:%p)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$R $2  Failed ... $N"
        exit 1
    else 
        echo -e "$G $2 Success ... $N"
    fi
}


if [ $USERID -ne 0 ] 
then
    echo -e " $R You need to have super user access $N"
    exit 1
else
    echo -e "$G You are super user $N"
fi  

# Jenkins installation
curl /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
validate $? "Adding jenkins repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
validate $? "importing keys"

# Java INstallation
yum install fontconfig java-21-openjdk jenkins -y
validate $? "Installing java"

systemctl daemon-reload
validate $? "Reloading after installing"

systemctl enable jenkins
validate $? "Enabling jenkins service"

systemctl start jenkins
validate $? "Start of jenkins"