provider "aws" {
	region = var.aws_region
}

provider "aws" {
        alias  = "prod"
	region = "us-east-1"
}

module "ec2_instance_one" {
        source = "./ec2-module/instance"
        instance_name = "myvm01"
}

module "ec2_instance_two" {
        source = "./ec2-module/instance"
        instance_name = "myvm02"
}

module "ec2_instance_three" {
        source = "./ec2-module/instance"
        providers = {
          aws = aws.prod
        }
        ami = "ami-0b0dcb5067f052a63"
        instance_type = "t2.nano"
        instance_name = "myvm03"
}