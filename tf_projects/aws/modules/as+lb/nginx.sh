#!/bin/bash
sudo apt update
sudo apt install nginx -y
systemctl start nginx
systemctl enable nginx