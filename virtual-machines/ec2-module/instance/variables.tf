variable "ami" {
  type          = string
  default       = "ami-0beaa649c482330f7"
}

variable "instance_type" {
  type          = string
  default       = "t2.nano"
}

variable "instance_name" {
  description   = "Value of the Name tag for the EC2 instance"
  type          = string
  default       = "ExampleInstance"
}

variable "key_name" {
  type          = string
  default       = "majora"
}

variable "root_volume_size" {
  type        = number
  description = "Root Volume size of the EC2 Instance"
  default     = 10
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type of the EC2 Instance"
  default     = "gp2"
}

variable "data_volume_size" {
  type        = number
  description = "Data volume size of the EC2 Instance"
  default     = 10
}

variable "data_volume_type" {
  type        = string
  description = "Data volume type of the EC2 Instance"
  default     = "gp2"
}

variable "subnet_test_private" {
  type        = string
  default     = "subnet-0391eb4aa6a6e9892"
}

variable "subnet_test_public" {
  type        = string
  default     = "subnet-0a60b1ae5d6d6ba57"
}

variable "subnet_prod_private" {
  type        = string
  default     = "subnet-096fb3a94ea2df20f"
}

variable "subnet_prod_public" {
  type        = string
  default     = "subnet-0f6d1e72edef4904a"
}