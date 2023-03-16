//vpc values
env               = "test"
namespace         = "ecom_infra"
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
  vpc_name                      = "ecom_vpc"
  env                           = "test"
  "kubernetes.io/clus/eter/eks" = "shared"
  "kubernetes.io/rolelb"        = 1
  mail                          = "shubhamb@greamio.com"
  team                          = "DevOps"
}

//eks values
cluster_name    = "test_eks_cluster"
node_group_name = "test_node_group"
desired_size    = 1
max_size        = 1
min_size        = 1

