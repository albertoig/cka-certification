terraform {
  backend "s3" {
    bucket = "albertoig"
    key    = "cka/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# 
provider "digitalocean" {}

provider "aws" {
  region  = "us-west-2"
  profile = "default"
}