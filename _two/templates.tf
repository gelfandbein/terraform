####################################################################################################
# DEVELOP SERVER
####################################################################################################
data "template_file" "user-data-develop" {
  template = "${file("${path.module}/scripts/user-data-develop.tpl")}"

  vars = {
    zabbix_server           = "${var.zabbix_server}"
    zabbix_hostname_develop = "${var.zabbix_hostname_develop}"
    users                   = "${var.users[0]}"
    f_name                  = "${var.f_name}"
    l_name                  = "${var.l_name}"
    user_data_server        = "${var.user_data_server}"
  }
}

####################################################################################################
# PRODUCT SERVER
####################################################################################################
data "template_file" "user-data-product" {
  template = "${file("${path.module}/scripts/user-data-product.tpl")}"

  vars = {
    zabbix_server           = "${var.zabbix_server}"
    zabbix_hostname_product = "${var.zabbix_hostname_product}"
    users                   = "${var.users[0]}"
    f_name                  = "${var.f_name}"
    l_name                  = "${var.l_name}"
    user_data_server        = "${var.user_data_server}"
  }
}

