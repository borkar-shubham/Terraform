resource "aws_instance" "server-1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = ["${aws_security_group.tf_vpc_sg.id}"]
  subnet_id              = aws_subnet.tf_vpc_pub_sub.id
  user_data              = file("${path.module}/user_data.sh")
  tags = {
    Name      = var.instance_name
    Env       = "Testing"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip #self is mentioned to avoid infinite loop between instance and provisioner.
  }
}

//creating ssh-key pair
resource "aws_key_pair" "tf_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/id_rsa.pub")
}

//To generate ssh key pair in current working directory -
// ssh-keygen
// it will ask where to save, simply put: ./id_rsa

//elastic ip
resource "aws_eip" "tf_eip" {
  vpc = true
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.server-1.id
  allocation_id = aws_eip.tf_eip.id
}

//Provisioners are used to transfer the files from host machine to remote server.
# Provisioners can transfer files, local-exec, remote-exec
# provisioner "file" {
#   source = "file1.txt"  #from host machine
#   destination = "/tmp/file1.txt"  #to remote machine 
# }
#   provisioner "local-exec" {
#     command = "echo testing > /tmp/test.txt"
#   }
#   provisioner "local-exec" {
#     working_dir = "/tmp"
#     command = "echo ${self.public_ip}>myip.txt"
#   }
#   provisioner "local-exec" {
#     command = "env>env.txt"
#     environment = {
#       envname = "envvalue"
#     }
#   }
# }

//terraform backend to store the tfstate file in remote storage for collaborative environment.
//also avoid simultaneous tf apply with help of backed locking with dynamodb_table
# terraform {
#   backend "s3" {
#     bucket = "gaurav-youtube-tf"
#     region = "us-east-1"
#     key="terraform.tfstate"
#     dynamodb_table = "gaurav-youtube-tf-table"
#   }
# }