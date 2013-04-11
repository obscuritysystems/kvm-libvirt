#!/user/bin/python

import sys,libvirt

vmid = int(sys.argv[1])

conn = libvirt.open(None)
dom = conn.lookupByID(vmid)
dom.shutdown()
