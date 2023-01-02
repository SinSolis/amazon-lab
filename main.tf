provider "aws" {
    region = "us-east-1"
    default_tags {
      tags = {
        Environment = "Test"
      }
    }
}

provider "aws" {
    alias  = "prod"
    region = "us-east-2"
    default_tags {
      tags = {
        Environment = "Prod"
      }
    }
}

module "test_network" {
  source = "./modules/aws_network_instance"
}

# deploys in east region 1
module "prod_network" {
    source = "./modules/aws_network_instance"
    aws_az = "us-east-2a"
    providers = {
        aws = aws.prod
    }
}

module "ec2_instance_one" {
  source        = "./modules/aws_server_instance"
  instance_name = "myvm01"
  vpc_sg_id     = [module.test_network.default_vpc_sg]
  subnet_id     = module.test_network.test_public_subnet
}

module "ec2_instance_two" {
  source        = "./modules/aws_server_instance"
  instance_name = "myvm02"
  vpc_sg_id     = [module.test_network.default_vpc_sg]
  subnet_id     = module.test_network.test_private_subnet
}

# deploys in east region 1
module "ec2_instance_three" {
  source = "./modules/aws_server_instance"
  providers = {
    aws = aws.prod
    }
  ami = "ami-0283a57753b18025b"
  instance_name = "myvm03"
  vpc_sg_id     = [module.prod_network.default_vpc_sg]
  subnet_id     = module.prod_network.test_public_subnet
}