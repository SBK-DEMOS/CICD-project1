
## Step-01: Introduction ##  
Install Terraform CLI & AWS CLI according to your Laptop/Desktop OS(MAC/Windows/Linux).  

[Install Terraform CLI](https://developer.hashicorp.com/terraform/downloads)  
[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  

Install VS Code Editor (Optional)  
Install HashiCorp Terraform plugin for VS Code (Optional)  

## Step-02: Prepare AWS account ##  

* Create AWS account and create "Your-Admin-User"   

* Generate Security Credentials using AWS Management Console  
   * Go to Services -> IAM -> Users -> "Your-Admin-User" -> Security Credentials -> Create Access Key  

* Configure AWS credentials using SSH Terminal on your local desktop   

#### Configure AWS Credentials in command line ####  
     $ aws configure  
     AWS Access Key ID [None]: AKIXXXXXXXXXXXXMZ7K  
     AWS Secret Access Key [None]: WL9XXXXXGm7w9tXXXXXX+XXX/K5F3HWtdFH/  
     Default region name [None]: us-east-1  
     Default output format [None]: json  

#### Verify if we are able list S3 buckets ####  
     aws s3 ls  

#### Verify the AWS Credentials Profile ####  

     cat $HOME/.aws/credentials  
     [default]  
     aws_access_key_id = BxxxxxxxxxxxxxxxxK  
     aws_secret_access_key = hxxxxxxx43j8jjjklxxxxxyzzzzz  

  Note: By default, these files are located at $HOME/.aws/config and $HOME/.aws/credentials on Linux and macOS, and "%USERPROFILE%\.aws\config" and "%USERPROFILE%\.aws\credentials" on Windows.  
     If no named profile is specified, the default profile is used. Use the profile parameter or AWS_PROFILE environment variable to specify a named profile.  

## Step-03: Provision & Launch EC2 server with Jenkins ##  

* Use the given Terraform files(.tf files)  
   * Terraform takes latest Amazon Linux AMI dynamically for EC2 creation and two security groups are created(vpc_ssh & vpc-web). Ports 22, 80 & 8080 are opened for external access.  
* init_jenkins.sh file installs httpd, JAVA, Jenkins, Git, Docker and updates AWS CLI to the latest.  

## Step-04: Install Maven and export Env ## 

* Install Maven  
We are going to build and deploy Java APPs. So, need Maven for build purpose.  
[Get the required Maven S/W](https://dlcdn.apache.org/maven/)  
      
       sudo su -
       cd /opt/  
       wget https://dlcdn.apache.org/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.tar.gz  
       tar -xvzf apache-maven-3.8.7-bin.tar.gz 
       
 
  
* Set/Export environment  
  
 [root@Jenkins-server ~]# find / -name java-11* | grep x86_64  
 /usr/lib/jvm/java-11-amazon-corretto.x86_64  

     vi ~/.bash_profile  
     JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64  
     export JAVA_HOME  
     M2_HOME=/opt/apache-maven-3.8.7  
     M2=$M2_HOME/bin  
     export M2  
     PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2  

     source ~/.bash_profile  

* Check if maven works properly:  

     mvn version
     
* Restart Jenkins  

      systemctl status jenkins  
      systemctl restart jenkins  

* Assign shell to Jenkins user  

```  
	[root@Jenkins-server opt]# grep -i jenkins /etc/passwd  
	jenkins:x:995:993:Jenkins Automation Server:/var/lib/jenkins:/bin/false  
```  


      vi /etc/passwd   
	    change shell from /bin/false to /bin/bash  

  
  Example o/p:  
  ```
  jenkins:x:995:993:Jenkins Automation Server:/var/lib/jenkins:/bin/bash   
  ```
 
 * Provide permissions to jenkins user in jenkins server to access docker  
 
 ```
      [root@ip-xxx-xx-x-xx opt]# cat /etc/group | grep -i docker  
      docker:x:991:  
      
      sudo usermod -aG docker jenkins  

      [root@ip-xxx-xx-x-xx opt]# cat /etc/group | grep -i docker  
      docker:x:991:jenkins  
 ```  
 
 * Give proper permissions to docker.sock as Jenkins will be able to access. 
```
     sudo chmod 777 /var/run/docker.sock   
```  

* Jenkin runs docker commands during pipeline. So, Add Jenkins user into sudoers file to get sudo access  
```  
    vi /etc/sudoers  
    jenkins ALL=(ALL) NOPASSWD: ALL  
```  

* Install Maven & Docker plugins in Jenkins  

  Access Jenkins UI(http://Public-IP:8080).    
  If its first time you will be asked to get initialAdminPassword from Linux(Jenkins) server from the below location  
```  
      cat /var/lib/jenkins/secrets/initialAdminPassword  
```  
  Click "Install Suggested Plugins" and create Admin user(Ex:Admin123)is created and necessary plugins are installed.  
  At Genkins UI, Manage Jenkins ==> Manage Plugins ==> Check if aleady installed  
  If not installed, Go to Available Plugins ==> select "Docker Pipeline" install.(Do the same for "Maven Integration")  
     


 
 
  
  



  







