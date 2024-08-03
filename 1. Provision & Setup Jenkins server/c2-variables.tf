# AWS Region
variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "eu-central-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "SBK_devopskeypair1"
}

export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$HGD: SGVsbG8sIEdvb2QgRGF5

ENV PASSWORD = secret
