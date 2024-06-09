resource "aws_instance" "server1" {
ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sg-demo.name]
  key_name      = "week7d2"
  tags = {
    Name = "Terraform server"
    Team = "DevOps"
    env  = "dev"
  }
  user_data = file("install.sh")
}
