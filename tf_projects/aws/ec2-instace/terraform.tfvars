instance_name = "docker-server"
instance_type = "t2.micro"
image_name    = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
key_pair_name = "tf_key_pair"
ports         = [22, 80, 443, 8080, 3306]
# image_id      = "ami-08d4ac5b634553e16"  (do not require bcoz we set it up from data source)
# instance_name = Application_Server
