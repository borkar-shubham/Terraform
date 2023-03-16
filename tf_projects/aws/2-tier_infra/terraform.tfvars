env               = "test"
namespace         = "2-tier-infra"
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
  mail      = "shubham.borkar@greamio.com"
  team      = "DevOps"
}

//DB values
db_identifier  = "2-tier-db"
db_engine      = "mysql"
engine_version = "8.0.28"
instance_class = "db.t3.micro"
username       = "admin"
password       = "admin123"

//Application tier values
lt_name          = "app_tier_lt"
lb_name          = "app-tier-lb"
asg_name         = "app-asg"
min_size         = 1
max_size         = 3
desired_capacity = 2
tg_name          = "app-tg"
tg_port          = "8080"
