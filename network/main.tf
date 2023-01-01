provider "aws" {
	region = var.aws_region
}

provider "aws" {
    alias  = "prod"
	region = "us-east-1"
}

# module "network_one" {
#         source = "./network-module/instance"
# }

# deploys in east region 1
module "network_two" {
    source = "./network-module/instance"
    providers = {
        aws = aws.prod
    }
}