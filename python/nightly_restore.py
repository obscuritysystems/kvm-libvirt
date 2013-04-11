#!/usr/bin/env python

import libvirt
import pprint
conn = libvirt.open("qemu:///system")

for id in conn.listDomainsID():
	try:	
		dom = conn.lookupByID(id)
		print 'Reverting %s' % dom.name()
		snap = dom.snapshotLookupByName('Revert',0)
		dom.destroy()
		dom.revertToSnapshot(snap,0)
	except:
		pass
	
