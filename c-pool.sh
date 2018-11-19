#!/bin/bash

for i in {10..20};do

echo `mkdir /var/lib/libvirt/test3-pool/pool$i`
echo "
<pool type='dir'>
  <name>pool$i</name>
  <uuid>`uuidgen`</uuid>
  <capacity unit='GiB'>1</capacity>
#  <allocation unit='bytes'>81493512192</allocation>
#  <available unit='bytes'>24307036160</available>
  <source>
  </source>
  <target>
    <path>/var/lib/libvirt/test3-pool/pool$i</path>
#    <permissions>
#      <mode>0711</mode>
#      <owner>0</owner>
#      <group>0</group>
#    </permissions>
  </target>
</pool>" > /var/lib/libvirt/test2/pool$i
echo `virsh pool-define pool$i`
echo `virsh pool-start pool$i`
done
