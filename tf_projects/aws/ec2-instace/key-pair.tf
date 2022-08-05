//creating ssh-key pair
resource "aws_key_pair" "tf_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("${path.module}/id_rsa.pub")
}



//To generate ssh key pair in current working directory -
// ssh-keygen
// it will ask where to save, simply put: ./id_rsa