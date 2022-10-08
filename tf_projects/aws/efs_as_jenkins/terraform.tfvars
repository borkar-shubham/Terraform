//vpc variables
env               = "test"
namespace         = "jenkins_project"
vpc_cidr          = "10.0.0.0/20"
pub_sub_cidr      = ["10.0.0.0/22"]
pvt_sub_cidr      = ["10.0.4.0/22"]
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
  efs = {
    port = 2049
  }
}
tags = {
  vpc_name  = "tf_vpc"
  env       = "test"
  bill_unit = "zshapr-102"
  mail      = "shubhamb@greamio.com"
  team      = "DevOps"
}

//efs values
performance_mode = "generalPurpose"
throughput_mode  = "bursting"
encrypted        = true

//autoscaling variables