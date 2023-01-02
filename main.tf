provider "aws" {
    region = "us-east-2"
    default_tags {
      tags = {
        Environment = "test"
      }
    }
}

provider "aws" {
    alias  = "prod"
    region = "us-east-1"
    default_tags {
      tags = {
        Environment = "prod"
      }
    }
}

module "network_one" {
  source = "./modules/aws_network_instance"
}

# # deploys in east region 1
# module "network_two" {
#     source = "./network-module/"
#     aws_az = "us-east-1a"
#     providers = {
#         aws = aws.prod
#     }
# }

module "ec2_instance_one" {
  source        = "./modules/aws_server_instance"
  instance_name = "myvm01"
  subnet_id     = module.network_one.test_public_subnet
  vpc_sg_id = ["module.network_one.default_vpc_sg"]
}

# module "ec2_instance_two" {
#   source = "./modules/aws_server_instance"
#   instance_name = "myvm02"
# }

# # deploys in east region 1
# module "ec2_instance_three" {
#   source = "./modules/aws_server_instance"
#   providers = {
#     aws = aws.prod
#     }
#   ami = "ami-0b0dcb5067f052a63"
#   instance_name = "myvm03"
# }