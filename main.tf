#how to create ec2 instance
resource "aws_instance" "server1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  key_name = "barrone"
  tags = {
    Name = "Terraform server"
    Team = "DevOps" 
    env  = "dev"
  }
  user_data = file("install.sh")
}
  # how to create volume
  resource "aws_ebs_volume" "vol1" {
    availability_zone = aws_instance.server1.availability_zone  #this is just to pull the avaliabilty zone from ec2(declearing)
    size = 10
    tags = {
        Name = "terraform volume"
        Team = "cloud"
        Created-by = "terraform"
    }
  }
  #how to attach volume to instace
  resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.vol1.id
    instance_id = aws_instance.server1.id           #this is just to pull the instance id from ec2(declearing)

    
  }
