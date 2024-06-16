terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
  backend "s3" {
    bucket  = "s3-lightning-talk-20240622"
    key     = "state/s3-lightning-talk-20240622.tfstate"
    region  = "ap-northeast-1"
    profile = "inspector_terraform_switch_role"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "inspector_terraform_switch_role"
}
