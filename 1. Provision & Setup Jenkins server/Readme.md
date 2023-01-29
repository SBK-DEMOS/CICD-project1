
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
aws_secret_access_key = hxyvfsfsf767jjjjklxxxxxyzzzzz  

  Note: By default, these files are located at $HOME/.aws/config and $HOME/.aws/credentials on Linux and macOS, and "%USERPROFILE%\.aws\config" and "%USERPROFILE%\.aws\credentials" on Windows.  
     If no named profile is specified, the default profile is used. Use the profile parameter or AWS_PROFILE environment variable to specify a named profile.  

