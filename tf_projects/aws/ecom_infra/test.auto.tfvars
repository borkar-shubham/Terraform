//vpc values
env               = "test"
namespace         = "ecom"
vpc_cidr          = "192.168.0.0/24"
pub_sub_cidr      = ["192.168.0.0/26", "192.168.0.64/26"]
pvt_sub_cidr      = ["192.168.0.128/26", "192.168.0.192/26"]
availability_zone = ["us-east-1a", "us-east-1b"]
ingress = {
  ssh = {
    port = 22
  },
  http = {
    description = "TLS from VPC"
    port        = 80

  },
  tomcat = {
    port        = 8080
    cidr_blocks = ["172.25.0.0/20"]
  }
}

tags = {
  vpc_name  = "tf_vpc"
  env       = "test"
  bill_unit = "zshapr-102"
  mail      = "shubhamb@greamio.com"
  team      = "DevOps"
}

//load_balancer values
lb_type = "application"
tg = {
  laptop = {
    priority = "100"
    port     = 8081
    path     = "/laptop/*"
    hc       = "/laptop/healthz"
  },
  mobile = {
    priority = "200"
    port     = 8082
    path     = "/mobile/*"
    hc       = "/mobile/healthz"
  },
  mens-cloths = {
    priority = "300"
    port     = 8083
    path     = "/mens-cloths/*"
    hc       = "/mens-cloths/healthz"
  }
}