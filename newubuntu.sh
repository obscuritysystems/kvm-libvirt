#!/bin/bash
MAC=`/root/scripts/newmac.sh`
IMAGE_PATH=/var/lib/libvirt/images
#ISO_PATH=/var/lib/libvirt/images
ISO_PATH=/opt
if [ "$#" -eq 3 ]
then
        /usr/bin/qemu-img create -f qcow2 -o preallocation=metadata $IMAGE_PATH/$1.qcow2 $3G
        virt-install  -n $1 -r $2 --os-type=linux --os-variant=debianlenny --disk $IMAGE_PATH/$1.qcow2,format=qcow2 --location http://mirrors.xmission.com/ubuntu/dists/quantal/main/installer-amd64/  -x "console=ttyS0" --hvm --accelerate --network bridge=virbr0,mac=$MAC --vnc 
else

        echo "Three arguments required ./newvm.sh vm-name ramsize disksize"
        exit
fi

