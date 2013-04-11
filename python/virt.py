import libvirt
import pprint
conn = libvirt.open("qemu:///system")
dom = conn.lookupByName('DVWA')
name = dom.snapshotListNames(0)
print name
#dom.destroy()

snap = dom.snapshotLookupByName('DVWA-RESTORE',0)
pprint.pprint(dir(snap))
dom.revertToSnapshot(snap,0)
dom.destroy()
dom.create()

#pprint.pprint(dir(dom))
#dom.revertToSnapshot()
#dom.
#snapshot-list DVWA DVWA-RESTORE
#29 - LEFT_CTRL, 56 - LEFT_ALT, 111 - DELETE
#dom.sendKey(0, 0, [29, 56, 111], 3, 0)
