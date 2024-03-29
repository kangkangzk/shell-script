#!/bin/bash

#k2

#configure source
cat >/etc/yum.repos.d/docker-ce.repo<<eof
[docker-ce]
name=docker
baseurl=https://mirrors.aliyun.com/docker-ce/linux/centos/7.7/x86_64/stable/
gpgcheck=0
enabled=1
eof

# install docker
rpm -q docker-ce &>/dev/null
if [ $? -ne 0 ]
then
yum -y install docker-ce
else
echo "Docker has been installed"
exit
fi

#mirror acceleration

cat >/etc/docker/daemon.json<<eof
{
"registry-mirrors":["http://hub-mirror.c.163.com","https://docker.mirrors.ustc.edu.cn"]
}
eof

#start docker
echo "Installation completed and started"
systemctl enable --now docker &&  echo -e "\t\t[\033[32mOK\033[0m]"



