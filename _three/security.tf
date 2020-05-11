####################################################################################################
# WEB SERVER
####################################################################################################
resource "aws_security_group" "test-1-web" {
  name        = "test-1-web"
  description = "Dynamic Outbound WEB Server Security Group"


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
    Owner = "TAG test-1-web"
  }

}

####################################################################################################
# APP SERVER
####################################################################################################
resource "aws_security_group" "test-1-app" {
  name        = "test-1-app"
  description = "Dynamic Outbound APP Server Security Group"


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
    Owner = "TAG test-1-app"
  }

}

####################################################################################################
# DB SERVER
####################################################################################################
resource "aws_security_group" "test-1-db" {
  name        = "test-1-db"
  description = "Dynamic Outbound DB Server Security Group"


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
    Owner = "TAG test-1-db"
  }

}

