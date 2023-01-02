provider "aws" {
    region = var.aws_region
    default_tags {
      tags = {
        environment = "test"
        Owner = "proxy"
      }
    }
}

provider "aws" {
    alias  = "prod"
	region = "us-east-1"
    default_tags {
      tags = {
        environment = "prod"
        Owner = "proxy"
      }
    }
}

module "network_one" {
        source = "./network-module"
}

# # deploys in east region 1
# module "network_two" {
#     source = "./network-module/"
#     aws_az = "us-east-1a"
#     providers = {
#         aws = aws.prod
#     }
# }