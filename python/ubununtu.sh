#!/bin/bash
MAC=`./newmac.sh`

if [ "$#" -eq 2 ]
then 
	virt-install --nographics -n $1 -r $2 --os-type=linux --os-variant=debianlenny --disk /var/lib/libvirt/images/$1.qcow2,device=disk,bus=virtio,size=24,sparse=true,format=qcow2 -w bridge=br0,model=virtio --noautoconsole --location  http://mirrors.xmission.com/ubuntu/dists/quantal/main/installer-amd64/ -x "console=ttyS0" 
	#virt-install  -n $1 -r $2 --os-type=linux --os-variant=rhel6 --disk /opt/kvm/images/$1.qcow2,device=disk,bus=virtio,size=24,sparse=true --location /opt/CentOS-6.3-x86_64-netinstall.iso -x "console=ttyS0" --hvm --nographics --accelerate --network bridge=virbr0,mac=$MAC                                                      
else 

	echo "two arguments required ./newvm.sh vmname ramsize"
	exit
fi

#virt-install  -n $1 -r $2 --os-type=linux --os-variant=rhel6 --disk /opt/kvm/images/$1.qcow2,device=disk,bus=virtio,size=24,sparse=true --location /opt/CentOS-6.3-x86_64-netinstall.iso -x "console=ttyS0" --hvm --nographics --accelerate --network bridge=virbr0,mac=$MAC                                                      
