# region / regions where we deploy our infrastructure
variable aws_region {
  default = "eu-central-1"
}

variable aws_credentials {
  default = "~/.aws/credentials"
}

variable "data_link" {
  type    = string
  default = "https://gbl-user-data.s3.eu-central-1.amazonaws.com"
}

variable "f_name" {
  type    = string
  default = "John"
}

variable "l_name" {
  type    = string
  default = "Wick"
}

