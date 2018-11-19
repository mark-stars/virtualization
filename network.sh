#!/bin/bash

for i in {10..20};do 
echo "
<network>
  <name>test$i</name>
  <uuid>`uuidgen`</uuid>
  <bridge name='virbr$i' stp='off' delay='0'/>
  <mac address='52:54:00:7a:22:$i'/>
  <domain name='test$i'/>
  <ip address='192.168.$i.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.$i.11' end='192.168.$i.254'/>
    </dhcp>
  </ip>
</network>" > test$i
echo `virsh net-define test$i`
echo `virsh net-start test$i`
done
