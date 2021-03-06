#!/bin/sh

ver_user_data="1.0 beta"
tmp_dir="/home/ec2-user/tmp"
###
# Download & Install
###
sudo yum -y update
sudo yum -y install httpd mc ps_mem
sudo systemctl enable httpd
sudo systemctl restart httpd

sudo yum -y install http://repo.zabbix.com/zabbix/4.4/rhel/8/x86_64/zabbix-agent-4.4.8-1.el8.x86_64.rpm
sudo systemctl restart zabbix-agent

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
<br><h2>${zabbix_hostname} public IP: $PublicIP</h2>
<br><h2>${zabbix_hostname} local IP: $LocalIP</h2>
<br>Build by Terraform!
<br>Owner ${f_name} ${l_name}
<br>Created at $Cur_Date
<br>Version = $ver_user_data
</body>
</html>
EOF

cat <<EOF > /etc/zabbix/zabbix_agentd.conf
#cat > /etc/zabbix/zabbix_agentd.conf << '_END'
LogType=file
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=10
PidFile=/var/run/zabbix/zabbix_agentd.pid
StartAgents=0
Timeout=5
RefreshActiveChecks=60
ServerActive=${zabbix_server}
Hostname=${zabbix_hostname}
#_END
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

wget ${data_link}/asg/user_data_asg.sh
chmod +x user_data_asg.sh && echo "chmod"
$tmp_dir/user_data_asg.sh && echo ".sh"
