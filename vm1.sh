#!/bin/bash

mkdir /var/lib/libvirt/vm

for i in {10..11};do

cd /var/lib/libvirt/test3-pool
qemu-img create -f qcow2 vm$i.qcow2 10G

echo "

<domain type='kvm'>
  <name>vm$i</name>
  <uuid>`uuidgen`</uuid>
  <memory>219200</memory>
  <currentMemory>219200</currentMemory>
  <vcpu>1</vcpu>
  <os>
    <type arch='x86_64' machine='pc'>hvm</type>
    <boot dev='cdrom'/>
  </os>
  <devices>
    <emulator>/usr/bin/kvm-spice</emulator>
    <disk type='file' device='cdrom'>
      <source file='/home/ma/Documents/镜像/CentOS-7-x86_64-Minimal-1804.iso'/>
      <target dev='hdc'/>
      <readonly/>
    </disk>
    <disk type='file' device='disk' >
      <source file='/var/lib/libvirt/test3-pool/vm$i.qcow2'/>
      <target dev='vda' bus='virtio'/>
    </disk>
    <interface type='network'>
      <source network='default'/>
    </interface>
    <graphics type='vnc' port='-1'/>
  </devices>
</domain>" > /var/lib/libvirt/vm/vm$i

virsh define /var/lib/libvirt/vm/vm$i
virsh start vm$i
done
