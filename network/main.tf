provider "aws" {
    region = var.aws_region
    default_tags {
      tags = {
        Enviroemnt = "test"
        Owner = "mono"
      }
    }
}

provider "aws" {
    alias  = "prod"
	region = "us-east-1"
}

module "network_one" {
        source = "./network-module/"
}

# deploys in east region 1
module "network_two" {
    source = "./network-module/"
    providers = {
        aws = aws.prod
    }
}