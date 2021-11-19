#!/bin/sh -e

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

cp -v ./beagle-flasher /usr/sbin/
cp -v ./init-beagle-flasher /usr/sbin/
cp -v ./init-beagle-flasher-test /usr/sbin/
cp -v ./init-shutdown-beagle-flasher /usr/sbin/
cp -v ./beagle-flasher-init-shutdown.service /lib/systemd/system/

###FIXME: only for testing...
if [ ! -f /etc/default/beagle-flasher ] ; then
	echo "source=/dev/mmcblk0" > /etc/default/beagle-flasher
	echo "destination=/dev/mmcblk1" >> /etc/default/beagle-flasher
	echo "rfs_partition=single" >> /etc/default/beagle-flasher
	echo "rfs_rootfs_type=ext4" >> /etc/default/beagle-flasher
	echo "rfs_rootfs_startmb=4" >> /etc/default/beagle-flasher
fi

