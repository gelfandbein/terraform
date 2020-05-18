data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_availability_zones" "working" {}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "my_vpcs" {}

