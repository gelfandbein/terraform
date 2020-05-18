####################################################################################################
# Create:
#        - Security Group for Web Server
#        - Launch Configuration with Auto AMI Lookup
#        - Auto Scaling Group using in 2 Availability Zones
#        - Classic Load Balancer in 2 Availability Zones
#
####################################################################################################

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_credentials
  profile                 = "terraform"
  version                 = "~> 2.61"
}

provider "template" {
  version = "~> 2.1"
}

####################################################################################################

resource "aws_eip" "my-static-eip" {
  instance = aws_instance.my-server.id

  tags = {
    Name    = "Server IP"
    Owner   = "John Wick"
    Project = "Darth Vader"
  }
}

resource "aws_instance" "my-server" {
  ami                    = data.aws_ami.latest_amzn2.id
  instance_type          = "t2.micro"
  key_name               = "test-1-frankfurt"
  vpc_security_group_ids = [aws_security_group.my-server.id]

  tags = {
    Name    = "WebServer by Terraform"
    Owner   = "John Wick"
    Project = "Darth Vader"
  }

  user_data = data.template_file.user-data.rendered
}

