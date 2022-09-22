
//ec2-instance variables
web_tier_name       = "Web_Server"
app_tier_name       = "Application_Server"
web_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
app_tier_image_name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

//vpc variables
ports = [22, 80, 443, 8080, 3306]

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
# security_groups = [module.vpc.tf_vpc_sg_id]
# vpc_zone = [module.vpc.tf_vpc_pub_sub_id, module.vpc.tf_vpc_pvt_sub_id]
# vpc_id = module.vpc.tf_vpc_id

//database variables
db_identifier = "three-tier-db"