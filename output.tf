###################
# MAIN OUTPUT
###################
output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}

output "data_aws_region_name" {
  value = data.aws_region.current.name
}

output "data_aws_region_description" {
  value = data.aws_region.current.description
}

output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

####################################################################################################
# DEVELOP SERVER
####################################################################################################
output "develop_instance_id" {
  value = aws_instance.develop[0].id
}

output "develop_public_ip" {
  value = aws_eip.develop-eip[0].public_ip
}

output "develop_private_ip" {
  value = aws_eip.develop-eip[0].private_ip
}

####################################################################################################
# PRODUCT SERVER
####################################################################################################
output "product_instance_id" {
  value = aws_instance.product[0].id
}

output "product_public_ip" {
  value = aws_eip.product-eip[0].public_ip
}

output "product_private_ip" {
  value = aws_eip.product-eip[0].private_ip
}

####################################################################################################
# OTHER OUTPUT
####################################################################################################
output "latest_amzn2_name" {
  value = data.aws_ami.latest_amzn2.name
}

output "latest_amzn2_id" {
  value = data.aws_ami.latest_amzn2.id
}


output "aws_vpcs" {
  value       = data.aws_vpcs.my_vpcs.ids
  description = "Default VPC 172.31.0.0/16"
}
