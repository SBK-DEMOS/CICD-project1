terraform {
required_version = "~> 1.3.7"
required_providers {
  aws = {
    source = "hashicorp/aws"
    version = "~> 4.0"
  }
}
}

provider "aws" {
  region = var.aws_region
  profile = "default"
}

# Password: pwdwelcome123
# secret:Admin@123
