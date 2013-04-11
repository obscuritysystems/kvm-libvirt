virt-install --name myWinXP --ram 512 --disk path=/var/lib/libvirt/images/WinXP3.qcow2,format=qcow2 --network bridge=br69 --vnc --os-variant winxp -c /var/lib/libvirt/images/en_winxp_pro_with_sp2.iso
