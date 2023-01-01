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
        subnet_test_public = "subnet-0a60b1ae5d6d6ba57"   
}

module "ec2_instance_two" {
        source = "./ec2-module/instance"
        subnet_test_private = "subnet-0391eb4aa6a6e9892"
        instance_name = "myvm02"
}

# deploys in east region 1
module "ec2_instance_three" {
        source = "./ec2-module/instance"
        providers = {
          aws = aws.prod
        }
        ami = "ami-0b0dcb5067f052a63"
        subnet_prod_public = "subnet-0f6d1e72edef4904a"
        instance_name = "myvm03"
}