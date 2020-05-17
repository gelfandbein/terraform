#!/bin/sh

ver_user_data="1.3 beta"
tmp_dir="/home/ec2-user/tmp"
###
# Download & Install
###
sudo yum -y update
sudo yum -y install httpd mc
sudo systemctl enable httpd
sudo systemctl restart httpd

###
# Make some files
###
PublicIP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
LocalIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
Cur_Date=$(date +"%Y-%m-%d  %H-%M")

cat <<EOF > /var/www/html/index.html
<html>
<meta http-equiv="refresh" content="60">
<body>
<br><h2>AutoScalingGroup public IP: $PublicIP</h2>
<br><h2>AutoScalingGroup local IP: $LocalIP</h2>
<br>Build by Terraform!
<br>Owner ${f_name} ${l_name}
<br>Created at $Cur_Date
<br>Version = $ver_user_data
</body>
</html>
EOF

###
# Turn ON/OFF services
###
# systemctl enable httpd

###
# Start services
###


###
# Other
###

mkdir $tmp_dir
cd $tmp_dir
cd /home/ec2-user/tmp

wget ${data_server}/scripts/user_data_asg.sh
chmod +x user_data_asg.sh && echo "chmod"
$tmp_dir/user_data_asg.sh && echo ".sh"
