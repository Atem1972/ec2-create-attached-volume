#create keypair
resource "tls_private_key" "ec2_key" {
    algorithm = "RSA"
    rsa_bits = 2048
  
}
resource "aws_key_pair" "key_ec2" {
    key_name = "barrone"
    public_key = tls_private_key.ec2_key.public_key_openssh
  
}
#save file
resource "local_file" "ssh_key" {
  fileename = "barrone.pem"
  content = tls_private_key.ec2_key.private_key_pem
}