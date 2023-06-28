#!/bin/bash
sudo apt update
sudo apt install nginx -y
systemctl start nginx
systemctl enable nginx

sudo apt update -y
sudo apt install default-jre -y
sudo apt install tomcat9 tomcat9-admin -y 
sudo systemctl start tomcat9
sudo systemctl enable tomcat9