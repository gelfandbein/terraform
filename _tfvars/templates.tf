####################################################################################################
# DEVELOP SERVER
####################################################################################################
data "template_file" "user-data" {
  template = "${file("${path.module}/scripts/user-data.tpl")}"

  vars = {
    zabbix_server   = "${var.zabbix_server}"
    zabbix_hostname = "${var.zabbix_hostname}"
    data_server     = "${var.data_link}"
    f_name          = "${var.f_name}"
    l_name          = "${var.l_name}"
  }
}

