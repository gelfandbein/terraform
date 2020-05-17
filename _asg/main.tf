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

resource "aws_launch_configuration" "web" {
  name_prefix     = "LaunchConf-"
  image_id        = data.aws_ami.latest_amzn2.id
  instance_type   = "t2.micro"
  key_name        = "test-1-frankfurt"
  security_groups = [aws_security_group.web.id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = data.template_file.user_data.rendered
}

resource "aws_autoscaling_group" "web" {
  name                 = "ASG-${aws_launch_configuration.web.id}"
  launch_configuration = aws_launch_configuration.web.name
  max_size             = 3
  min_size             = 2
  min_elb_capacity     = 2
  health_check_grace_period = 300
  health_check_type         = "ELB" # or EC2
  force_delete              = true
  vpc_zone_identifier       = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  load_balancers            = [aws_elb.web.name]

  lifecycle {
    create_before_destroy = true
  }

  tags = [{
    key                 = "Name"
    value               = "WebServer-in-ASG"
    propagate_at_launch = true
    },
    {
      key                 = "Owner"
      value               = "Developer"
      propagate_at_launch = true
  }]
}

resource "aws_launch_template" "web" {
  name_prefix   = "WebServer-Template"
  image_id      = data.aws_ami.latest_amzn2.id
  instance_type = "t2.micro"
}


resource "aws_elb" "web" {
  name                 = "WebServer-ELB"
  availability_zones = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  security_groups    = [aws_security_group.web.id]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }

  tags = {
    Name = "WebServer-Highly-Available-ELB"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}
