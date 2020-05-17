####################################################################################################
# DEVELOP SERVER
####################################################################################################
data "template_file" "user_data" {
  template = "${file("${path.module}/scripts/user_data.tpl")}"

  vars = {
    data_server = "${var.data_server}"
    f_name = "${var.f_name}"
    l_name = "${var.l_name}"
  }
}

