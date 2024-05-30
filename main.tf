terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.1"
    }
  }
  required_version = ">= 1.2.0"
}

module "provider" {
  source = "./0-provider"
}

module "vpc" {
  source = "./1-vpc"
}

module "ec2" {
  source = "./2-ec2"
}

module "rds" {
  source = "./3-rds"
}
