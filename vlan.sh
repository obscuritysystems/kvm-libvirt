#!/binbash
brctl addbr br10
vconfig add eth1 10
ifconfig eth1.10 up
brctl addif br10 eth1.10
ifconfig br10 up

brctl addbr br30
vconfig add eth1 30
ifconfig eth1.30 up
brctl addif br10 eth1.30
ifconfig br10 up

