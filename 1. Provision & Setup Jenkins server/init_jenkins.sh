#! /bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to SBKSimplify - APP-1</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to SBK Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html

# Install JAVA
sudo yum -y install java-11*

#Install/update latest AWS CLI, 
 
	sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	sudo unzip awscliv2.zip
	sudo ./aws/install

# Install Jenkins
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins

# Start jenkins service
sudo systemctl enable jenkins

# Enable auto start Jenkins whenever EC2 server restarts
sudo systemctl start jenkins

##4. Install Git and Docker

    sudo yum -y install git 

	sudo yum -y install docker
	sudo systemctl start docker
	sudo systemctl enable docker





