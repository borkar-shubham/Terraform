//creating ssh-key pair
resource "aws_key_pair" "virginia-key-terraform" {
  key_name   = "virginia-key-terraform"
  public_key = file("${path.module}/id_rsa.pub")
}



//To generate ssh key pair in current working directory -
// ssh-keygen
// it will ask where to save, simply put: ./id_rsa