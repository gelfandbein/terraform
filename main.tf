# Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-076431be05aaf8080 (64-bit x86)
# Amazon Linux 2 comes with five years support.
# It provides Linux kernel 4.14 tuned for optimal performance on Amazon EC2,
# systemd 219, GCC 7.3, Glibc 2.26, Binutils 2.29.1, and the latest software packages through extras.

# Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-03ab4e8f1d88ce614 (64-bit x86)
# The Amazon Linux AMI is an EBS-backed, AWS-supported image.
# The default image includes AWS command line tools, Python, Ruby, Perl, and Java.
# The repositories include Docker, PHP, MySQL, PostgreSQL, and other packages.

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
# DEVELOP SERVER
####################################################################################################
resource "aws_eip" "develop-eip" {
  instance = aws_instance.develop[0].id
  count    = "1"

  tags = {
    Name        = "develop-eip"
    Owner       = "develop-eip"
    Description = "develop-eip"
  }
}

resource "aws_instance" "develop" {
  ami           = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
  count         = "1"
  key_name      = "test-1-frankfurt"
  hibernation   = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name  = "develop"
    Owner = "develop"
  }

  lifecycle {
    # prevent_desroy = true
    create_before_destroy = true
  }

  vpc_security_group_ids = [aws_security_group.develop_sg.id]

  user_data = data.template_file.user_data_develop.rendered

  # depends_on = [aws_instance.product]

}

####################################################################################################
# PRODUCT SERVER
####################################################################################################
resource "aws_eip" "product-eip" {
  instance = aws_instance.product[0].id
  count    = "1"

  tags = {
    Name        = "product-eip"
    Owner       = "product-eip"
    Description = "product-eip"
  }
}

resource "aws_instance" "product" {
  ami           = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
  count         = "1"
  key_name      = "test-1-frankfurt"
  hibernation   = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name  = "product"
    Owner = "product"
  }

  lifecycle {
    # prevent_desroy = true
    create_before_destroy = true
  }

  vpc_security_group_ids = [aws_security_group.product_sg.id]

  user_data = data.template_file.user_data_product.rendered

  # depends_on = [aws_instance.product]

}
