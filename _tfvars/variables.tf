# region / regions where we deploy our infrastructure
variable aws_region {
  description = "Region to place the server"
  default     = "eu-central-1"
}

variable aws_credentials {
  default = "~/.aws/credentials"
}

variable "data_server" {
  type    = string
  default = "test.lt.com.ua"
}

variable "zabbix_server" {
  type    = string
  default = "194.79.22.154"
}

variable "zabbix_hostname" {
  type    = string
  default = "aws_develop"
}

variable "f_name" {
  type    = string
  default = "John"
}

variable "l_name" {
  type    = string
  default = "Wick"
}

variable "allow_ports" {
  type    = list
  default = ["22", "80", "443"]
}
