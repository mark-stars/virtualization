#! /bin/bash

virsh list --all > ./vm1.txt
cat vm1.txt | grep -v "^$" | awk 'NR>2{print $2}' > ./vm2.txt

for i in `cat ./vm2.txt`
do
	virsh start $i
done

rm -rf ./vm1.txt ./vm2.txt
