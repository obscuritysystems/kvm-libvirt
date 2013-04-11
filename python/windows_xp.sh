virt-install --name myWinXP --ram 512 --disk path=/var/lib/libvirt/images/myWinXP.qcow2,format=qcow2 --network bridge=br0 --vnc --os-variant winxp -c /home/nemus/en_winxp_pro_with_sp2.iso
