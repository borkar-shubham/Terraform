#!/bin/bash
sudo apt update -y
sudo apt install default-jre -y
sudo apt install tomcat9 tomcat9-admin -y 
sudo systemctl start tomcat9
sudo systemctl enable tomcat9