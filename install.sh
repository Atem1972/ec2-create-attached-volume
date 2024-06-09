install.sh
sudo yum update -y
sudo yum install git httpd wget unzip -y
sudo systemctl start httpd 
sudo systemctl enable httpd
sudo groupadd devops 
sudo useradd valery