#!/bin/bash
MAC=`/root/scripts/newmac.sh`
IMAGE_PATH='/var/lib/libvirt/images/'


if [ "$#" -eq 3 ]
then 
	/usr/bin/qemu-img create -f qcow2 -o preallocation=metadata $IMAGE_PATH$1.qcow2 $3G
	virt-install  -n $1 -r $2 --os-type=linux --os-variant=rhel6 --disk $IMAGE_PATH$1.qcow2  --location /opt/CentOS-6.3-x86_64-netinstall.iso -x "console=ttyS0" --hvm --accelerate --network bridge=virbr0,mac=$MAC --vnc                                                      
else 

	echo "Three arguments required ./newvm.sh vm-name ramsize disksize"
	exit
fi

#virt-install  -n $1 -r $2 --os-type=linux --os-variant=rhel6 --disk /opt/kvm/images/$1.qcow2,device=disk,bus=virtio,size=24,sparse=true --location /opt/CentOS-6.3-x86_64-netinstall.iso -x "console=ttyS0" --hvm --nographics --accelerate --network bridge=virbr0,mac=$MAC                                                      
