#!/bin/bash

#

if (! which wget &>/dev/null )
then
    yum -y install wget
fi
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

#install mysql5.7
wget http://repo.mysql.com/mysql57-community-release-el7.rpm 
rpm -ivh mysql57-community-release-el7.rpm
sed -ri '/gpgcheck/s|1|0|g' /etc/yum.repos.d/mysql-community.repo
sed -ri '/gpgkey/d' /etc/yum.repos.d/mysql-community.repo
yum install -y mysql-community-server

#install php7.2 and httpd
rpm -ivh https://repo.webtatic.com/yum/el7/epel-release.rpm
rpm -ivh https://repo.webtatic.com/yum/el7/webtatic-release.rpm
yum install -y  httpd  php72w php72w-cli php72w-fpm php72w-common php72w-devel php72w-embedded php72w-gd php72w-mbstring php72w-mysqlnd php72w-opcache php72w-pdo php72w-xml
# start server
systemctl enable --now httpd
systemctl enable --now mysqld

#test access

echo "<?php
  phpinfo();
?>

">/var/www/html/test.php





