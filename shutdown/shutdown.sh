#! /bin/bash

virsh list > ./vm1.txt
#choose what you need,for example "grep H"
cat vm1.txt | grep -v "^$" | awk 'NR>2{print $2}' > ./vm2.txt

for vm_name in `cat ./vm2.txt`
do
	virsh shutdown ${vm_name}
done

rm -rf ./vm1.txt ./vm2.txt
