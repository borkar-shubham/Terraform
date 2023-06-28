
//ec2-instance variables
web_tier_name       = "Web_Server"
app_tier_name       = "Application_Server"
web_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
app_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

//vpc variables
env               = "dev"
namespace         = "3-tier-infra"
vpc_cidr          = "10.0.0.0/20"
pub_sub_cidr      = ["10.0.0.0/22", "10.0.4.0/22"]
pvt_sub_cidr      = ["10.0.8.0/22", "10.0.12.0/22"]
availability_zone = ["us-east-1a", "us-east-1b"]
ingress = {
  ssh = {
    port = 22
  },
  http = {
    description = "http connection"
    port        = 80
  },
  https = {
    description = "Secure HTTPS from VPC"
    port        = 443
    cidr_blocks = ["172.25.0.0/20"]
  },
  tomcat = {
    port = 8080
  },
  mysql = {
    port = 3306
  }
}
tags = {
  vpc_name  = "tf_vpc"
  env       = "test"
  bill_unit = "zshapr-102"
  mail      = "shubhamb@greamio.com"
  team      = "DevOps"
}

//autoscaling load_balancer variables
lt_name          = ["web_tier_lt", "app_tier_lt"]
asg_name         = ["web_asg", "app-asg"]
min_size         = ["1", "2"]
max_size         = ["3", "4"]
desired_capacity = ["2", "3"]
tg_name          = ["web-tg", "app-tg"]
tg_port          = ["80", "8080"]
lb_name          = ["web-tier-lb", "app-tier-lb"]
# lb_type = "application"

//database variables
db_identifier  = "three-tier-db"
db_engine      = "mysql"
engine_version = "8.0.28"
instance_class = "db.t3.micro"
username       = "admin"
password       = "admin123"