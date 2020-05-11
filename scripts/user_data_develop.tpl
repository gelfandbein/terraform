#!/bin/sh

###
# Download & Install
###
sudo yum -y update
sudo yum -y install httpd
sudo yum -y install http://repo.zabbix.com/zabbix/4.4/rhel/8/x86_64/zabbix-agent-4.4.8-1.el8.x86_64.rpm
sudo yum -y install mc

###
# Make some files
###
PublicIP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
LocalIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
Cur_Date=$(date +"%m-%d-%Y %H-%M")

cat <<EOF > /var/www/html/index.html
<html>
<meta http-equiv="refresh" content="60">
<body>
<br><h2>DEVELOP public IP: $PublicIP</h2>
<br><h2>DEVELOP local IP: $LocalIP</h2>
<br>Build by Terraform!
<br>Owner ${f_name} ${l_name}
<br>Created at $Cur_Date
<br>
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
Hostname=${zabbix_hostname_develop}
#_END
EOF

###
# Turn ON/OFF services
###
sudo systemctl enable httpd
sudo systemctl enable zabbix-agent

###
# Start services
###

sudo systemctl restart httpd
sudo systemctl restart zabbix-agent
