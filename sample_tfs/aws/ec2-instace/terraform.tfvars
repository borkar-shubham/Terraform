//VPC Stuff
vpc_cidr     = "192.168.0.0/24"
pub_sub_cidr = "192.168.0.0/25"
pvt_sub_cidr = "192.168.0.128/25"

ports         = [22, 80, 443, 3306]
instance_type = "t2.micro"
image_name    = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
key_pair_name = "tf_key_pair"
# image_id      = "ami-08d4ac5b634553e16"  (do not require bcoz we set it up from data source)
# instance_name = Application_Server
