# region / regions where we deploy our infrastructure
variable aws_region {
  default = "eu-central-1"
}

variable aws_credentials {
  default = "~/.aws/credentials"
}

variable "f_name" {
  type    = string
  default = "John"
}

variable "l_name" {
  type    = string
  default = "Wick"
}

############################
# servers
###########################
variable "zabbix_server" {
  type    = string
  default = "194.79.22.154"
}

variable "data_link" {
  type    = string
  default = "https://gbl-user-data.s3.eu-central-1.amazonaws.com"
}

variable "users" {
  type    = list
  default = ["root", "user1", "user2"]
}

variable "zabbix_hostname_develop" {
  type    = string
  default = "aws-develop"
}

variable "zabbix_hostname_product" {
  type    = string
  default = "aws-product"
}

