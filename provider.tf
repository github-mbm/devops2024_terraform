terraform {
  required_version = "<= 1.7.5" # Forcing which version tf should use
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.53.0" # Forcing which version plugin should use
    }
  }
  # This backend configuration instructs Terraform to store its state in an S3 bucket.
  backend "s3" {
    bucket = "conmod"           # Name of the S3 bucket where the state will be stored.
    key    = "jun_2024.tfstate" # Path within the bucket where the state will be read/written.
    region = "ap-south-1"       # AWS region of the S3 bucket.
    #dynamodb_table = "terraform-lock" # DynamoDB table used for state locking.
    #encrypt        = true  # Ensures the state is encrypted at rest in S3.
  }
}

# Configure the AWS Provider

provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "seoul"
  region = "ap-northeast-2"
}



