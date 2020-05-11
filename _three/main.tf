# Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-076431be05aaf8080 (64-bit x86)
# Amazon Linux 2 comes with five years support.
# It provides Linux kernel 4.14 tuned for optimal performance on Amazon EC2,
# systemd 219, GCC 7.3, Glibc 2.26, Binutils 2.29.1, and the latest software packages through extras.

# Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-03ab4e8f1d88ce614 (64-bit x86)
# The Amazon Linux AMI is an EBS-backed, AWS-supported image.
# The default image includes AWS command line tools, Python, Ruby, Perl, and Java.
# The repositories include Docker, PHP, MySQL, PostgreSQL, and other packages.

data "aws_availability_zones" "working" {}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = ".credentials"
  version                 = "~> 2.61"
}

####################################################################################################
# WEB SERVER
####################################################################################################
resource "aws_eip" "test-1-web-eip" {
  instance = aws_instance.test-1-web[0].id
  count    = "1"

  tags = {
    Name        = "test-1-web-eip"
    Owner       = "test-1-web-eip"
    Description = "test-1-web-eip"
  }
}

resource "aws_instance" "test-1-web" {
  ami           = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
  count         = "1"
  key_name      = "test-1-frankfurt"
  hibernation   = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name  = "test-1-web"
    Owner = "test-1-web"
  }

  lifecycle {
    # prevent_desroy = true
    create_before_destroy = true
  }

  vpc_security_group_ids = [aws_security_group.test-1-web.id]

  user_data = data.template_file.user_data_web.rendered

  depends_on = [aws_instance.test-1-app, aws_instance.test-1-db]
}

####################################################################################################
# APP SERVER
####################################################################################################
resource "aws_eip" "test-1-app-eip" {
  instance = aws_instance.test-1-app[0].id
  count    = "1"

  tags = {
    Name        = "test-1-app-eip"
    Owner       = "test-1-app-eip"
    Description = "test-1-app-eip"
  }
}

resource "aws_instance" "test-1-app" {
  ami           = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
  count         = "1"
  key_name      = "test-1-frankfurt"
  hibernation   = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name  = "test-1-app"
    Owner = "test-1-app"
  }

  lifecycle {
    # prevent_desroy = true
    create_before_destroy = true
  }

  vpc_security_group_ids = [aws_security_group.test-1-app.id]

  user_data = data.template_file.user_data_app.rendered
}

####################################################################################################
# DB SERVER
####################################################################################################
resource "aws_eip" "test-1-db-eip" {
  instance = aws_instance.test-1-db[0].id
  count    = "1"

  tags = {
    Name        = "test-1-db-eip"
    Owner       = "test-1-db-eip"
    Description = "test-1-db-eip"
  }
}

resource "aws_instance" "test-1-db" {
  ami           = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
  count         = "1"
  key_name      = "test-1-frankfurt"
  hibernation   = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name  = "test-1-db"
    Owner = "test-1-db"
  }

  lifecycle {
    # prevent_desroy = true
    create_before_destroy = true
  }

  vpc_security_group_ids = [aws_security_group.test-1-db.id]

  user_data = data.template_file.user_data_db.rendered

}
