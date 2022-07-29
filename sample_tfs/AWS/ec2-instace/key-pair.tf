//creating ssh-key pair
resource "aws_key_pair" "virginia-key-terraform" {
  key_name   = "virginia-key-terraform"
  public_key = file("${path.module}/id_rsa.pub")
}