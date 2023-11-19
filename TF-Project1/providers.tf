terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile = "customprofile" 
  }
  
  