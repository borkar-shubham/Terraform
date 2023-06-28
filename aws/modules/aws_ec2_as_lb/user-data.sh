#!/bin/bash

# sudo apt update
# sudo apt install nginx -y
# systemctl start nginx
# systemctl enable nginx

sudo apt update -y
sudo apt install default-jre -y
sudo apt install tomcat9 tomcat9-admin -y 
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

#efs-jenkins user data
# #!/bin/bash
# sudo apt update -y
# sudo apt install default-jre -y
# sudo apt install nfs-common -y
# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# sudo apt update -y
# sudo mkdir -p /var/lib/jenkins
# # sudo mount -t nfs ${aws_efs_file_system.tf_efs.dns_name}:/ /var/lib/jenkins 
# echo "${aws_efs_file_system.tf_efs.dns_name}:/ /var/lib/jenkins nfs4 defaults 0 0" | sudo tee -a /etc/fstab   ### I exclude this line
# sudo apt install jenkins -y
# sudo chown -R jenkins:jenkins /var/lib/jenkins
# sudo systemctl start jenkins