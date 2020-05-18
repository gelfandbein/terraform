####################################################################################################
# DEVELOP SERVER
####################################################################################################
resource "aws_security_group" "develop_sg" {
  # vpc_id      = aws_vpc.develop-vpc.id
  name        = "develop"
  description = "DEVELOP Server Security Group"

  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner = "develop"
  }

}

####################################################################################################
# PRODUCT SERVER
####################################################################################################
resource "aws_security_group" "product_sg" {
  # vpc_id      = aws_vpc.product-vpc.id
  name        = "product"
  description = "PRODUCT Server Security Group"

  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner = "product"
  }

}

