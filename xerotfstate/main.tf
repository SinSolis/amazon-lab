# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 2.7.0"
#     }
#   }
# }

provider "aws" {
	region = var.aws_region
}

provider "aws" {
        alias  = "prod"
	region = "us-east-1"
}

module "my_instance_module" {
        source = "./my-modules/instance"
        ami = "ami-0beaa649c482330f7"
        instance_type = "t2.nano"
        instance_name = "myvm01"
}

module "my_instance_module_two" {
        source = "./my-modules/instance"
        ami = "ami-0beaa649c482330f7"
        instance_type = "t2.nano"
        instance_name = "myvm02"
}

module "my_instance_module_three" {
        source = "./my-modules/instance"
        providers = {
          aws = aws.prod
        }
        ami = "ami-0b0dcb5067f052a63"
        instance_type = "t2.nano"
        instance_name = "myvm03"
}
