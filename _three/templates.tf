####################################################################################################
# WEB SERVER
####################################################################################################
data "template_file" "user_data_web" {
  template = "${file("${path.module}/scripts/user_data_web.tpl")}"

  vars = {
    zabbix_server       = "${var.zabbix_server}"
    zabbix_hostname_web = "${var.zabbix_hostname_web}"
    users               = "${var.users[0]}"
    f_name              = "${var.f_name}"
    l_name              = "${var.l_name}"
  }
}

####################################################################################################
# APP SERVER
####################################################################################################
data "template_file" "user_data_app" {
  template = "${file("${path.module}/scripts/user_data_app.tpl")}"

  vars = {
    zabbix_server       = "${var.zabbix_server}"
    zabbix_hostname_app = "${var.zabbix_hostname_app}"
    users               = "${var.users[0]}"
    f_name              = "${var.f_name}"
    l_name              = "${var.l_name}"
  }
}

####################################################################################################
# DB SERVER
####################################################################################################
data "template_file" "user_data_db" {
  template = "${file("${path.module}/scripts/user_data_db.tpl")}"

  vars = {
    zabbix_server      = "${var.zabbix_server}"
    zabbix_hostname_db = "${var.zabbix_hostname_db}"
    users              = "${var.users[0]}"
    f_name             = "${var.f_name}"
    l_name             = "${var.l_name}"
  }
}

