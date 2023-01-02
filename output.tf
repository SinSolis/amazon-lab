output "instance_ip_addr_one" {
  value = module.ec2_instance_one.instance_ip_addr
  description = "The public IP address of the first instance."
}

# output "instance_ip_addr_two" {
#   value = module.ec2_instance_two.instance_ip_addr
#   description = "The public IP address of the second instance."
# }

# output "instance_ip_addr_three" {
#   value = module.ec2_instance_three.instance_ip_addr
#   description = "The public IP address of the third instance."
# }