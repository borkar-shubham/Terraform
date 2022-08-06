resource "aws_instance" "server-1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = ["${aws_security_group.tf_vpc_sg.id}"]
  subnet_id              = data.aws_subnet.public
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