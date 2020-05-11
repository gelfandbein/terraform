output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}

####################################################################################################
# WEB SERVER
####################################################################################################
output "test-1-web_instance_id" {
  value = aws_instance.test-1-web[0].id
}

output "test-1-web_public_ip" {
  value = aws_eip.test-1-web-eip[0].public_ip
}

output "test-1-web_private_ip" {
  value = aws_eip.test-1-web-eip[0].private_ip
}

####################################################################################################
# APP SERVER
####################################################################################################
output "test-1-app_instance_id" {
  value = aws_instance.test-1-app[0].id
}

output "test-1-app_public_ip" {
  value = aws_eip.test-1-app-eip[0].public_ip
}

output "test-1-app_private_ip" {
  value = aws_eip.test-1-app-eip[0].private_ip
}

####################################################################################################
# DB SERVER
####################################################################################################
output "test-1-db_instance_id" {
  value = aws_instance.test-1-db[0].id
}

output "test-1-db_public_ip" {
  value = aws_eip.test-1-db-eip[0].public_ip
}

output "test-1-db_private_ip" {
  value = aws_eip.test-1-db-eip[0].private_ip
}
