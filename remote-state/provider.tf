terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket ="mytfremotestate"  #s3 bucket name
    key ="venu.remotestate-demo" #just specify the key for we user different key for diffrentr repos and we don't use this for another repository
    region ="us-east-1"
    dynamodb_table ="venu"
  }
  
}


provider "aws" {
  # Configuration options
    region = "us-east-1"
}

