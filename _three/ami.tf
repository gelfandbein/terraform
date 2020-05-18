
data "aws_ami" "latest_amzn2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-*"]
  }
}

output "latest_amzn2_name" {
  value = data.aws_ami.latest_amzn2.name
}

output "latest_amzn2_id" {
  value = data.aws_ami.latest_amzn2.id
}