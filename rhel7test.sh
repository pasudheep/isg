#!/bin/bash
username=CCD
passwd=dmzPPC2011++

for host in `cat test`;
do
ssh $username@$host $passwd;
###QUALYS###

wget https://github.com/pasudheep/isg/blob/master/qualys_centos-rhel-oracle-amazon_cloud-agent.x86_64.rpm -P /tmp
rpm -ivh /tmp/qualys_centos-rhel-oracle-amazon_cloud-agent.x86_64.rpm
/usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=07d514b2-ffc1-4e18-aacf-5bbd8d00eb52 CustomerId=03952c71-bb64-e01d-82ae-a7f4f0158820
touch /etc/sysconfig/qualys-cloud-agent
echo "https://122.98.8.103:1080" > /etc/sysconfig/qualys-cloud-agent
service qualys-cloud-agent restart
service qualys-cloud-agent status
chkconfig qualys-cloud-agent on
done

