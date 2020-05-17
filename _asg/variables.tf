# region / regions where we deploy our infrastructure
variable aws_region {
  default = "eu-central-1"
}

variable aws_credentials {
  default = "~/.aws/credentials"
}


variable "data_server" {
  type    = string
  default = "http://test.lt.com.ua"
}

variable "f_name" {
  type    = string
  default = "John"
}

variable "l_name" {
  type    = string
  default = "Wick"
}

