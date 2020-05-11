#!/bin/sh

sudo yum -y update
sudo yum -y install httpd
sudo yum -y install http://repo.zabbix.com/zabbix/4.2/rhel/6/x86_64/zabbix-agent-4.2.2-1.el6.x86_64.rpm
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
<br><h2>WEB server with public IP: $PublicIP</h2>
<br><h2>WEB server with local IP: $LocalIP</h2>
<br>Build by Terraform!
<br>Owner ${f_name} ${l_name}
<br>Created $Cur_Date
<br>
</body>
</html>
EOF

cat <<EOF > /etc/zabbix/zabbix_agentd.conf
#cat > /etc/zabbix/zabbix_agentd.conf << '_END'
LogType=file
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=1
PidFile=/var/run/zabbix/zabbix_agentd.pid
StartAgents=0
ServerActive=${zabbix_server}
Hostname=${zabbix_hostname_web}
#_END
EOF

###
# Turn ON/OFF services
###
sudo systemctl enable httpd
sudo systemctl enable zabbix-agent
sudo chkconfig httpd on
sudo chkconfig zabbix-agent on
###
# Start services
###

sudo service httpd restart
sudo service zabbix-agent restart
