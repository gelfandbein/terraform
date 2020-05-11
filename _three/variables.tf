# region / regions where we deploy our infrastructure
variable aws_region { default = "eu-central-1" }

# servers
variable "f_name" {
  type    = string
  default = "Boris"
}

variable "l_name" {
  type    = string
  default = "Gelfandbein"
}


variable "zabbix_server" {
  type    = string
  default = "194.79.22.154"
}

variable "users" {
  type    = list
  default = ["root", "user1", "user2"]
}

variable "zabbix_hostname_web" {
  type    = string
  default = "aws-test-1-web"
}

variable "zabbix_hostname_app" {
  type    = string
  default = "aws-test-1-app"
}

variable "zabbix_hostname_db" {
  type    = string
  default = "aws-test-1-db"
}
