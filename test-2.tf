# Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-076431be05aaf8080 (64-bit x86)
# Amazon Linux 2 comes with five years support.
# It provides Linux kernel 4.14 tuned for optimal performance on Amazon EC2,
# systemd 219, GCC 7.3, Glibc 2.26, Binutils 2.29.1, and the latest software packages through extras.

# Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-03ab4e8f1d88ce614 (64-bit x86)
# The Amazon Linux AMI is an EBS-backed, AWS-supported image.
# The default image includes AWS command line tools, Python, Ruby, Perl, and Java.
# The repositories include Docker, PHP, MySQL, PostgreSQL, and other packages.


provider "aws" {
  region  = "eu-central-1"
  shared_credentials_file = ".credentials"

}

resource "aws_instance" "test-2-eu-central-1" {
  ami = "ami-03ab4e8f1d88ce614"
  instance_type = "t2.micro"
}
