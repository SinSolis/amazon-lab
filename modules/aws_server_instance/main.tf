terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_instance" "my_instance" {
	ami = var.ami
	instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_sg_id
  subnet_id = var.subnet_id

  # root disk
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvdc"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

	tags = {
		Name = var.instance_name	
	}
}
