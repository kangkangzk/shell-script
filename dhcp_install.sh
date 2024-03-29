#!/bin/bash

#kk
subnet=192.168.47.0
netmask=255.255.255.0
range1=192.168.47.50
range2=192.168.47.60
dns=192.168.47.130
dname=\"kkk.com\"
route=192.168.47.2
broadcast=192.168.47.255
if (! rpm -q dhcp &>/dev/null)
then
    yum install -y dhcp $>/dev/null
    echo "Installation is complete "
fi


echo "subnet ${subnet} netmask ${netmask}
{
  range ${range1} ${range2};
  option domain-name-servers ${dns};
  option domain-name "${dname}";
  option routers ${route};
  option broadcast-address ${broadcast};
  default-lease-time 600;
  max-lease-time 7200;
}
">/etc/dhcp/dhcpd.conf
sleep 1
systemctl enable --now dhcpd &> /dev/null&& echo "Successfully started "
