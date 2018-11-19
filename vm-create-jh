#!/bin/bash

for((i=1;i<2;i++))
do
cd /var/lib/libvirt/images/
qemu-img create -f qcow2 $i 10G
echo -e "cpu num: \c"
read num
echo -e "Mem num: \c"
read num1
echo -e "Iso path : \c"
read path
echo "
`virt-install \
--name $i \
--vcpus $num \
--memory $num1 \
--cpu host-passthrough \
--location $path \
--disk /var/lib/libvirt/images/$i \
--network bridge=br0 \
-x "console=ttyS0"`"
done
