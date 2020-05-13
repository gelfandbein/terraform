# region / regions where we deploy our infrastructure
variable aws_region {
  default = "eu-central-1"
}

variable aws_credentials {
  default = "~/.aws/credentials"
}

variable "f_name" {
  type    = string
  default = "Boris"
}

variable "l_name" {
  type    = string
  default = "Gelfandbein"
}

############################
# servers
###########################
variable "zabbix_server" {
  type    = string
  default = "194.79.22.154"
}

variable "user_data_server" {
  type    = string
  default = "test.lt.com.ua"
}

variable "users" {
  type    = list
  default = ["root", "user1", "user2"]
}

variable "zabbix_hostname_develop" {
  type    = string
  default = "aws_develop"
}

variable "zabbix_hostname_product" {
  type    = string
  default = "aws_product"
}

