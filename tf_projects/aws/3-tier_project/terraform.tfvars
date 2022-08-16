//vpc values
ports = [22, 80, 443, 8080, 3306]


//ec2-instance variables
web_tier_name       = "Web_Server"
app_tier_name       = "Application_Server"
web_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
app_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"