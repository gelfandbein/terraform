###################
# MAIN OUTPUT
###################
output "data_aws_availability_zones" {
  value = data.aws_availability_zones.available.names
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


#####################
output "web_loadblancer_url" {
  value = aws_elb.web.dns_name
}
